package hx2go.hxb.tools;

import hxb.Ast;

/**
	Traversal and transformation helpers for the untyped `hxb.Ast.HxbExpr`,
	modeled on `haxe.macro.ExprTools`. `iter`/`map` visit/rebuild immediate
	children; `walk`/`mapAll` recurse over the whole tree.

	`using hxb.tools.ExprTools;` to call these as methods.
**/
class ExprTools {
	/** Call `f` on every immediate child expression of `e`. **/
	public static function iter(e:HxbExpr, f:HxbExpr->Void):Void {
		switch (e.expr) {
			case EConst(_) | EBreak | EContinue:
			case EArray(e1, e2) | EBinop(_, e1, e2) | EWhile(e1, e2, _) | EFor(e1, e2): f(e1); f(e2);
			case EField(e1, _, _) | EParenthesis(e1) | EUnop(_, _, e1) | EUntyped(e1) | EThrow(e1) | ECast(e1, _) | EIs(e1, _) | EDisplay(e1, _) | ECheckType(e1, _) | EMeta(_, e1):
				f(e1);
			case EObjectDecl(fields): for (fld in fields) f(fld.expr);
			case EArrayDecl(values): for (x in values) f(x);
			case ECall(e1, params): f(e1); for (x in params) f(x);
			case ENew(_, params): for (x in params) f(x);
			case EVars(vars): for (v in vars) if (v.expr != null) f(v.expr);
			case EFunction(_, fn):
				for (a in fn.args) if (a.value != null) f(a.value);
				if (fn.expr != null) f(fn.expr);
			case EBlock(exprs): for (x in exprs) f(x);
			case EIf(c, eif, eelse) | ETernary(c, eif, eelse): f(c); f(eif); if (eelse != null) f(eelse);
			case ESwitch(e1, cases, edef):
				f(e1);
				for (c in cases) {
					for (v in c.values) f(v);
					if (c.guard != null) f(c.guard);
					if (c.expr != null) f(c.expr);
				}
				if (edef != null && edef.expr != null) f(edef.expr);
			case ETry(e1, catches): f(e1); for (c in catches) f(c.expr);
			case EReturn(e1): if (e1 != null) f(e1);
		}
	}

	/** Visit `e` and all descendants, pre-order (self first). **/
	public static function walk(e:HxbExpr, f:HxbExpr->Void):Void {
		f(e);
		iter(e, c -> walk(c, f));
	}

	/** Return a copy of `e` with each immediate child replaced by `f(child)`. **/
	public static function map(e:HxbExpr, f:HxbExpr->HxbExpr):HxbExpr {
		final def:HxbExprDef = switch (e.expr) {
			case EConst(_) | EBreak | EContinue: e.expr;
			case EArray(e1, e2): EArray(f(e1), f(e2));
			case EBinop(op, e1, e2): EBinop(op, f(e1), f(e2));
			case EWhile(e1, e2, nw): EWhile(f(e1), f(e2), nw);
			case EFor(e1, e2): EFor(f(e1), f(e2));
			case EField(e1, n, k): EField(f(e1), n, k);
			case EParenthesis(e1): EParenthesis(f(e1));
			case EUnop(op, post, e1): EUnop(op, post, f(e1));
			case EUntyped(e1): EUntyped(f(e1));
			case EThrow(e1): EThrow(f(e1));
			case ECast(e1, t): ECast(f(e1), t);
			case EIs(e1, t): EIs(f(e1), t);
			case EDisplay(e1, k): EDisplay(f(e1), k);
			case ECheckType(e1, t): ECheckType(f(e1), t);
			case EMeta(m, e1): EMeta(m, f(e1));
			case EObjectDecl(fields): EObjectDecl([for (fld in fields) {name: fld.name, pos: fld.pos, quotes: fld.quotes, expr: f(fld.expr)}]);
			case EArrayDecl(values): EArrayDecl([for (x in values) f(x)]);
			case ECall(e1, params): ECall(f(e1), [for (x in params) f(x)]);
			case ENew(t, params): ENew(t, [for (x in params) f(x)]);
			case EVars(vars): EVars([for (v in vars) {var nv = v; nv.expr = v.expr == null ? null : f(v.expr); nv;}]);
			case EFunction(kind, fn):
				fn.expr = fn.expr == null ? null : f(fn.expr);
				EFunction(kind, fn);
			case EBlock(exprs): EBlock([for (x in exprs) f(x)]);
			case EIf(c, eif, eelse): EIf(f(c), f(eif), eelse == null ? null : f(eelse));
			case ETernary(c, eif, eelse): ETernary(f(c), f(eif), f(eelse));
			case ESwitch(e1, cases, edef):
				ESwitch(f(e1), [for (c in cases) {values: [for (v in c.values) f(v)], guard: c.guard == null ? null : f(c.guard), expr: c.expr == null ? null : f(c.expr), pos: c.pos}],
					edef == null ? null : {expr: edef.expr == null ? null : f(edef.expr), pos: edef.pos});
			case ETry(e1, catches): ETry(f(e1), [for (c in catches) {name: c.name, type: c.type, expr: f(c.expr), pos: c.pos}]);
			case EReturn(e1): EReturn(e1 == null ? null : f(e1));
		};
		return new HxbExpr(def, e.pos);
	}
}
