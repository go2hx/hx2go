# `Syntax.typeSwitch` Implementation Plan

> **For Hermes:** mirrors the existing `Syntax.select` implementation end-to-end.

**Goal:** Expose Go's type switch (`switch v := x.(type) { case T: ... }`) to Haxe
code targeting Go, so extern/interface values can be dispatched on their dynamic
Go type.

**Architecture:** Same two-part shape as `Syntax.select`: (1) an `extern` API in
`_std/go/Syntax.hx` that Haxe code calls and type-checks against, (2) a
`CompilerPass` that pattern-matches the call on the typed AST and rewrites it to
a `__go__` string template (via `ExprHelper.createUntyped`) emitting raw Go. The
pass is registered in `Context.hx`'s pass list. No writer changes needed —
`select` proves the `__go__` template path already emits statement-form Go
(`Semantics.hx:77` whitelists `switch ` as a statement keyword).

**Tech Stack:** Haxe 5.0 (extern), hx2go compiler passes (`source/hx2go/passes`),
HXB typed AST (`hxb-parser`).

---

## Current context / how `select` works (ground truth)

- **Extern:** `_std/go/Syntax.hx:38` — `public extern static function select(...cases: Select): Void;`
  plus an `extern class Select` (lines 42–53) with static builder methods
  (`receive`, `send`, `defaultCase`) each returning `Select`, and a `private function new()`.
- **Pass:** `source/hx2go/passes/RewriteSyntaxSelect.hx`
  - `match()` detects `TCall(TField(_, FStatic({name:'Syntax', pack:['go']}, {name:'select'})), _)`.
  - `execute()` walks each param, unwraps `TParenthesis/TMeta/TCast`, matches the
    inner `TCall(TField(_, FStatic({name:'Select'}, cf)), cargs)`, and per case name
    builds a Go `case ...:` line. Expression operands are interpolated with a
    `slot()` helper that pushes a **copied** (`ExprCopy.copy`) node into `args` and
    returns a `{N}` placeholder. Callback bodies are extracted with `extractFn`
    (finds the `TFunction` node) and invoked as `{slot(fn)}(args)`.
  - Finishes: `ExprHelper.createUntyped(template, args)` → assigns `expr.expr`, then
    `context.submitNode(expr, true)`.
- **Registration:** `source/hx2go/Context.hx:173` — `new hx2go.passes.RewriteSyntaxSelect(this),`
- **Test:** `tests/unit/Select0.hx` — plain `function main()` with `assert(...)` calls.
- **Type-name emission (the new ingredient):** passes get the Go type string for an
  HXB type via `context.getWriter().types.writeHxbType(t).toString()` — see
  `RewriteGoBuiltinCreation.hx:30`. The `select` pass never needed this; type switch does.
- **Lambda arg type:** a `TFunction` carries `tfunc.args : Array<{v:HxbVar, value}>`
  and each `HxbVar` has a `.type` field (`hxb-parser/hxb/Typed.hx:57-60,142,158+`).
  The declared parameter type of each case callback **is** the case's Go type.

## Proposed API (Haxe surface)

Each case is a callback whose single parameter's declared type is the case type —
this is what makes the API feel like `select` while carrying the type to switch on:

```haxe
Syntax.typeSwitch(value,
    TypeSwitch.caseType((v: go.SomeStruct)  -> { use(v); }),
    TypeSwitch.caseType((v: go.OtherStruct) -> { use(v); }),
    TypeSwitch.defaultCase((v: Dynamic)     -> { fallback(v); })
);
```

- `value` is the interface/`Any`/`Dynamic` value being switched on (Go requires an
  interface operand for `x.(type)`; hx2go maps `Any`/`Dynamic`/extern interfaces to
  `interface{}`/`any`).
- `caseType` derives the Go type from the lambda parameter type and binds the
  narrowed value to the callback.
- `defaultCase` binds the original value at its interface type.

Target Go:

```go
switch _hx_tsw := value.(type) {
case GoTypeA:
    fnA(_hx_tsw)
case GoTypeB:
    fnB(_hx_tsw)
default:
    fnDefault(_hx_tsw)
}
```

Note: Go binds one `v` for the whole switch; in each `case T:` it has the narrowed
type `T`, and in `default:` it keeps the interface type. Passing that single
`_hx_tsw` into each per-case `fn` type-checks on the Go side because each `fn`'s
parameter type equals that case's type (and `Dynamic`→`any` for default).

## Design decisions (KISS)

- **One type per case** (no `case A, B:` multi-type). Simpler, matches how `select`
  keeps each builder to one concern; can be extended later if needed.
- **Reuse `_hx_`-prefixed bind name** (`_hx_tsw`) like `select`'s `_hx_recv`.
- **No new writer code.** Everything rides the existing `__go__` template path.
- **No "AI comments."** Keep only the terse `// Case.caseType(...) -> case T:` style
  one-liners that `RewriteSyntaxSelect` already uses, since the mapping is non-obvious.

---

### Task 1: Add the extern API to `_std/go/Syntax.hx`

**Files:** Modify `_std/go/Syntax.hx`

**Step 1:** After the `select` method (line 38) add:

```haxe
    /**
      Emits a `switch v := x.(type)` type switch in Go. Each case is built with
      `TypeSwitch.caseType`, whose callback parameter's declared type is the Go
      type to match; `TypeSwitch.defaultCase` handles the fallthrough.

      ```haxe
      Syntax.typeSwitch(value,
          TypeSwitch.caseType((v: go.SomeStruct) -> trace(v)),
          TypeSwitch.defaultCase((v: Dynamic) -> {})
      );
      ```

      Case bodies are inlined into the enclosing function, so `return`/`break`/
      `continue` inside a case applies to that function/loop.
    **/
    public extern static function typeSwitch<T>(value: T, ...cases: TypeSwitch): Void;
```

**Step 2:** After the `Select` extern class (line 53) add:

```haxe
extern class TypeSwitch {
    /** A `case T:` whose callback param type `T` is the matched Go type; the value is bound narrowed to `T`. **/
    public extern static function caseType<T>(f: T -> Void): TypeSwitch;

    /** The `default:` case; the callback receives the value at its interface type. **/
    public extern static function defaultCase<T>(f: T -> Void): TypeSwitch;

    private function new();
}
```

**Step 3 (verify compile of extern only):** inline transpile a tiny probe (see Task 4);
at this point only type-checking matters — without the pass the call will emit a
bad `__go__`, so defer runtime check to after Task 2.

---

### Task 2: Create the rewrite pass

**Files:** Create `source/hx2go/passes/RewriteSyntaxTypeSwitch.hx`

Model on `RewriteSyntaxSelect.hx`. Key differences:

- `match`: `TCall(TField(_, FStatic({name:'Syntax', pack:['go']}, {name:'typeSwitch'})), _)`.
- First param is the **subject** value → `slot(params[0])`, emit
  `switch _hx_tsw := {subject}.(type) {`.
- Remaining params are the case builders, matched as
  `TCall(TField(_, FStatic({name:'TypeSwitch'}, cf)), cargs)`.
- For `caseType`: extract the `TFunction` via `extractFn(cargs[0])`; read the Go
  type string from its single arg:
  ```haxe
  var fn = extractFn(cargs[0]);
  var goType = caseTypeOf(fn); // tfunc.args[0].v.type -> writer.types.writeHxbType(...).toString()
  template += 'case $goType:\n${slot(fn)}(_hx_tsw)\n';
  ```
- For `defaultCase`: `template += 'default:\n${slot(fn)}(_hx_tsw)\n';`
- Close with `template += '}';`, then `createUntyped` + `submitNode(expr, true)`.

Add a helper:

```haxe
function caseTypeOf(fn: HxbTypedExpr): String {
    return switch fn.expr {
        case TFunction(tf) if (tf.args.length == 1 && tf.args[0].v.type != null):
            context.getWriter().types.writeHxbType(tf.args[0].v.type).toString();
        case _: "any"; // unreachable for well-formed input; keep default safe
    }
}
```

Copy `unwrap` and `extractFn` verbatim from `RewriteSyntaxSelect.hx` (or, as a
follow-up cleanup once both land, hoist them to a shared util — defer to keep this
change minimal and reviewable).

**Pitfall to watch:** `extractFn` returns the first nested `TFunction`. For
`caseType`, the arg type must come from **that** function's first param, not from
any other closure in scope — fine because `cargs[0]` is the callback itself.

**Pitfall:** `_hx_tsw` must be referenced in every case or Go errors
"declared and not used" — passing it into each `fn(_hx_tsw)` satisfies this. If a
future `caseType` body ignores its arg, the callback param named `_` still receives
`_hx_tsw`, so usage is preserved.

---

### Task 3: Register the pass

**Files:** Modify `source/hx2go/Context.hx`

**Step 1:** After line 173 (`new hx2go.passes.RewriteSyntaxSelect(this),`) add:

```haxe
            new hx2go.passes.RewriteSyntaxTypeSwitch(this),
```

Ordering: keep it adjacent to the other `RewriteSyntax*` passes. It must run while
the `TCall`/`FStatic` shape is still intact (before any pass that would rewrite the
static call or the lambda), which is exactly where `select` sits.

---

### Task 4: Add a regression test

**Files:** Create `tests/unit/TypeSwitch0.hx`

Follow `tests/unit/Select0.hx` (plain `function main()` + `assert`). Minimal before/
after behavior covering: a matching case, a second type, and the default. Use a
Go-interface-typed subject so `.(type)` is valid. Candidate shape (confirm exact
extern types when writing):

```haxe
package unit;

import go.Syntax;

function main() {
    var any: Any = 42;
    var tag = "";
    Syntax.typeSwitch(any,
        TypeSwitch.caseType((v: Int)    -> { tag = "int"; }),
        TypeSwitch.caseType((v: String) -> { tag = "str"; }),
        TypeSwitch.defaultCase((v: Dynamic) -> { tag = "other"; })
    );
    assert(tag == "int");

    var any2: Any = "hi";
    Syntax.typeSwitch(any2,
        TypeSwitch.caseType((v: Int)    -> { tag = "int"; }),
        TypeSwitch.caseType((v: String) -> { tag = "str"; }),
        TypeSwitch.defaultCase((v: Dynamic) -> { tag = "other"; })
    );
    assert(tag == "str");
}
```

**Open question to resolve while writing the test:** how `Int`/`String` lower in a
Go type switch — hx2go may box them (`int` vs its `HxInt` wrapper, `string` vs
`HxString`). Inspect the generated `output/.../*.go` for the actual `case` type and,
if the boxed type differs from the dynamic type stored in `any`, prefer a Go extern
struct/interface subject for the canonical test and treat primitive boxing as a
documented edge. This is the main unknown and should be validated empirically, not
assumed.

---

## Validation

Per the hx2go-go-interop skill, verify in cheap stages (do **not** rely on a
blocking `--cmd` run):

1. **Build the compiler:** this repo's `hx2go` haxelib is a global dev-path —
   `haxelib path hx2go` must point at this worktree before building (memory note).
   Rebuild per the bootstrap workflow if the go target is exercised
   (`haxe Bootstrap.hxml -D rebuild`), since uncommitted pass edits are otherwise ignored.
2. **Interp cross-check:** `haxe Tests-each.hxml --interp` runs `tests/unit/*.hx` on
   plain Haxe — but `TypeSwitch0` only has meaningful semantics on the go target, so
   its real check is the go run. (Tests are picked up alphabetically; a crash blocks
   everything after it — keep the test green.)
3. **Go target end-to-end:** `haxe Tests.hxml` (needs `output/bootstrap/main/main.exe`).
   Clear `output/testbed/main` first to avoid stale-`.go` panics.
4. **Inspect generated Go:** grep `output/.../*.go` for `switch _hx_tsw := ... .(type)`
   and the expected `case` type names to confirm the template landed.

## Files likely to change

- `_std/go/Syntax.hx` (add `typeSwitch` + `TypeSwitch` extern class)
- `source/hx2go/passes/RewriteSyntaxTypeSwitch.hx` (new pass)
- `source/hx2go/Context.hx` (register pass, 1 line)
- `tests/unit/TypeSwitch0.hx` (new test)

## Risks / tradeoffs / open questions

- **Primitive boxing (main risk):** Haxe `Int`/`String` may not match Go's native
  `int`/`string` dynamic type inside `.(type)`. Validate empirically; the canonical
  test should use a Go extern type where the mapping is unambiguous. This is the one
  item that can't be settled by reading code alone.
- **Subject must be an interface in Go.** If `value`'s static type lowers to a
  concrete Go type, `x.(type)` won't compile. The `<T>` extern signature accepts
  anything; document that the operand should be `Any`/`Dynamic`/an extern interface.
  A future guard could reject concrete subjects in the pass with a clear error.
- **Single-type cases only** (no `case A, B:`). Deliberate for KISS; extendable.
- **`unwrap`/`extractFn` duplication** with `RewriteSyntaxSelect`. Acceptable for a
  minimal reviewable change; offer a follow-up to hoist to a shared util.
- **Return type of `typeSwitch` is `Void`** like `select`; case bodies inline into
  the enclosing scope, so control-flow keywords behave as in hand-written Go.
