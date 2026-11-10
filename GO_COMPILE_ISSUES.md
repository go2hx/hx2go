# Go Compile Issues — `haxe scripts/haxeunit.hxml -D testissues`
**43 failing issue tests** in `# main`, grouped by root cause and ranked by return on investment.

## Tier 1 — Best ROI
| Root cause | Issues | Effort |
|---|---|---|
| `@:const` generic param dropped → empty body / missing return | 3450, 6952, 6979, 9149, 7574 (5) | Low |
| `== null` on value-type `Null<T>` → `x != nil` type mismatch | 3094, 4842 (2) | Low |
| `null` → value type → "cannot convert nil to type" | 12415, 12415Abstract, 12435 (3) | Low |
## Tier 2 — Medium ROI
| Root cause | Issues | Effort |
|---|---|---|
| Erased generic result used as concrete → "need type assertion" | 3528, 3639, 4203, 6520, 8537, 12539, 7115 (7) | Med |
| `Null<T>` struct in arithmetic/compare → operator not defined | 3702, 9897, 12657 (3) | Med |
| `HxArray[T]` invariance (`[int32]` vs `[any]`) | 5793, 6560, 10124 (3) | Med |
| Variance: covariant return / contravariant param | 6486, 5113, 6325 (3) | Low–Med |
## Tier 3 — Defer (harder / one-offs)
| Root cause | Issues |
|---|---|
| Generic erasure: field/`new T()`/`Void` override on `any` | 3109, 6761, 13046 (3) |
| Enum RTTI / enum field access | 11425, 5025, 6159 (3) |
| Enum param extraction (payload as `any` / comma-ok in literal) | 12149, 2378 (2) |
| Assign to wrapped lvalue ("not addressable") | 13043, 2281, 5816 (3) |
| Rest/optional calling convention drops `...args` | 10018, 10955 (2) |
| `super.` undefined (abstract class / `@:using` static) | 11054, 3607 (2) |
| `?optArg` default name undefined | 4363 (1) |
| null `(T)->Void` invoked → nil call | 8986 (1) |
| Assign eval-order + `Dynamic` setField arith | 5477 (1) |
## Suggested order
1. Nullable-value subsystem — Tier 1 #2/#3 + Tier 2 struct-ops → **8 issues, one area**
2. `@:const` generics → **5 issues, one fix**
3. Variance (covariant return + contra param) → **3 issues**
4. Type-assertion insertion → **7 issues, highest count** (unlocks generic-erasure 3109/6761/13046)
5. Array variance → **2–3 issues**
Tiers 1–2 clear **~26 of 43** across 3–4 focused areas.
