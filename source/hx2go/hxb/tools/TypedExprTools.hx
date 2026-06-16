package hx2go.hxb.tools;

import hx2go.hxb.Typed;

/**
	Traversal and transformation helpers for `hxb.Typed.HxbTypedExpr`, modeled on
	`haxe.macro.TypedExprTools`.

	- `iter` visits each *immediate* child once.
	- `map` rebuilds a node, replacing each immediate child with `f(child)`.
	- `walk` / `iterAll` recurse over the whole tree (self first).
	- `mapAll` recursively rewrites the whole tree bottom-up.
	- plus `collect`, `find`, `count` convenience helpers.

	`using hxb.tools.TypedExprTools;` to call these as methods on a typed expr.
**/
class TypedExprTools {
	/** Call `f` on every immediate child expression of `e`. **/
	public static function iter(e:HxbTypedExpr, f:HxbTypedExpr->Void):Void {
		switch (e.expr) {
			case TConst(_) | TLocal(_) | TTypeExpr(_) | TBreak | TContinue | TIdent(_):
			case TArray(e1, e2) | TBinop(_, e1, e2): f(e1); f(e2);
			case TField(e1, _) | TParenthesis(e1) | TUnop(_, _, e1) | TThrow(e1) | TCast(e1, _) | TMeta(_, e1) | TEnumParameter(e1, _, _) | TEnumIndex(e1):
				f(e1);
			case TObjectDecl(fields):
				for (fld in fields) f(fld.expr);
			case TArrayDecl(el) | TBlock(el):
				for (x in el) f(x);
			case TCall(e1, el):
				f(e1);
				for (x in el) f(x);
			case TNew(_, _, el):
				for (x in el) f(x);
			case TFunction(tf):
				for (a in tf.args) if (a.value != null) f(a.value);
				f(tf.expr);
			case TVar(_, expr):
				if (expr != null) f(expr);
			case TIf(econd, eif, eelse):
				f(econd); f(eif);
				if (eelse != null) f(eelse);
			case TWhile(econd, e1, _):
				f(econd); f(e1);
			case TSwitch(subject, cases, edef):
				f(subject);
				for (c in cases) {
					for (p in c.patterns) f(p);
					f(c.expr);
				}
				if (edef != null) f(edef);
			case TTry(e1, catches):
				f(e1);
				for (c in catches) f(c.expr);
			case TReturn(e1):
				if (e1 != null) f(e1);
		}
	}

	/**
		Return a copy of `e` (same `t`/`pos`) with each immediate child replaced
		by `f(child)`.
	**/
	public static function map(e:HxbTypedExpr, f:HxbTypedExpr->HxbTypedExpr):HxbTypedExpr {
		final def:HxbTypedExprDef = switch (e.expr) {
			case TConst(_) | TLocal(_) | TTypeExpr(_) | TBreak | TContinue | TIdent(_): e.expr;
			case TArray(e1, e2): TArray(f(e1), f(e2));
			case TBinop(op, e1, e2): TBinop(op, f(e1), f(e2));
			case TField(e1, fa): TField(f(e1), fa);
			case TParenthesis(e1): TParenthesis(f(e1));
			case TUnop(op, post, e1): TUnop(op, post, f(e1));
			case TThrow(e1): TThrow(f(e1));
			case TCast(e1, m): TCast(f(e1), m);
			case TMeta(m, e1): TMeta(m, f(e1));
			case TEnumParameter(e1, ef, i): TEnumParameter(f(e1), ef, i);
			case TEnumIndex(e1): TEnumIndex(f(e1));
			case TObjectDecl(fields): TObjectDecl([for (fld in fields) {name: fld.name, pos: fld.pos, quotes: fld.quotes, expr: f(fld.expr)}]);
			case TArrayDecl(el): TArrayDecl([for (x in el) f(x)]);
			case TBlock(el): TBlock([for (x in el) f(x)]);
			case TCall(e1, el): TCall(f(e1), [for (x in el) f(x)]);
			case TNew(c, params, el): TNew(c, params, [for (x in el) f(x)]);
			case TFunction(tf):
				TFunction(new HxbTFunc([for (a in tf.args) {v: a.v, value: a.value == null ? null : f(a.value)}], tf.t, f(tf.expr)));
			case TVar(v, expr): TVar(v, expr == null ? null : f(expr));
			case TIf(econd, eif, eelse): TIf(f(econd), f(eif), eelse == null ? null : f(eelse));
			case TWhile(econd, e1, nw): TWhile(f(econd), f(e1), nw);
			case TSwitch(subject, cases, edef):
				TSwitch(f(subject), [for (c in cases) {patterns: [for (p in c.patterns) f(p)], expr: f(c.expr)}], edef == null ? null : f(edef));
			case TTry(e1, catches):
				TTry(f(e1), [for (c in catches) {v: c.v, expr: f(c.expr)}]);
			case TReturn(e1): TReturn(e1 == null ? null : f(e1));
		};
		return new HxbTypedExpr(def, e.t, e.pos);
	}

	/** Visit `e` and all its descendants, pre-order (self first). **/
	public static function walk(e:HxbTypedExpr, f:HxbTypedExpr->Void):Void {
		f(e);
		iter(e, child -> walk(child, f));
	}

	/** Alias for `walk`. **/
	public static inline function iterAll(e:HxbTypedExpr, f:HxbTypedExpr->Void):Void {
		walk(e, f);
	}

	/** Recursively rewrite the whole tree bottom-up (children before parent). **/
	public static function mapAll(e:HxbTypedExpr, f:HxbTypedExpr->HxbTypedExpr):HxbTypedExpr {
		return f(map(e, child -> mapAll(child, f)));
	}

	/** Collect every node (including `e`) for which `pred` is true. **/
	public static function collect(e:HxbTypedExpr, pred:HxbTypedExpr->Bool):Array<HxbTypedExpr> {
		final out = [];
		walk(e, x -> if (pred(x)) out.push(x));
		return out;
	}

	/** The first node (depth-first, self first) matching `pred`, or `null`. **/
	public static function find(e:HxbTypedExpr, pred:HxbTypedExpr->Bool):Null<HxbTypedExpr> {
		if (pred(e))
			return e;
		var found:Null<HxbTypedExpr> = null;
		iter(e, child -> {
			if (found == null)
				found = find(child, pred);
		});
		return found;
	}

	/** Total number of nodes in the tree rooted at `e`. **/
	public static function count(e:HxbTypedExpr):Int {
		var n = 0;
		walk(e, _ -> n++);
		return n;
	}

	/** All local variables declared (via `TVar`/`TFunction`/`TTry`) under `e`. **/
	public static function localVars(e:HxbTypedExpr):Array<HxbVar> {
		final out = [];
		walk(e, x -> switch (x.expr) {
			case TVar(v, _): out.push(v);
			case TFunction(tf): for (a in tf.args) out.push(a.v);
			case TTry(_, catches): for (c in catches) out.push(c.v);
			case _:
		});
		return out;
	}
}
