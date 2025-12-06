package;

import haxe.macro.Expr;
import HaxeExpr.HaxeVar;
import haxe.macro.Expr.ComplexType;

class HaxeExprTools {
    static inline function opt(e:Null<HaxeExpr>, f:HaxeExpr->HaxeExpr):HaxeExpr
    return e == null ? null : f(e);

	static inline function opt2(e:Null<HaxeExpr>, f:HaxeExpr->Void):Void
		if (e != null)
			f(e);
    static public function mapArray(el:Array<HaxeExpr>, f:HaxeExpr->HaxeExpr):Array<HaxeExpr> {
		var ret = [];
		for (e in el)
			ret.push(f(e));
		return ret;
	}

	static public function iterArray(el:Array<HaxeExpr>, f:HaxeExpr->Void):Void {
		for (e in el)
			f(e);
	}
    static public function iter(e:HaxeExpr, f:HaxeExpr->Void):Void {
		switch (e.def) {
			case EConst(_), EContinue, EBreak:
			case EField(e, _), EParenthesis(e), EUntyped(e), EThrow(e), EDisplay(e, _), ECheckType(e, _), EUnop(_, _, e), ECast(e, _), EIs(e, _) | EMeta(_, e):
				f(e);
			case EArray(e1, e2), EWhile(e1, e2, _), EBinop(_, e1, e2), EFor(e1, e2):
				f(e1);
				f(e2);
			case EVars(vl):
				for (v in vl)
					opt2(v.expr, f);
			case ETry(e, cl):
				f(e);
				for (c in cl)
					f(c.expr);
			case ETernary(e1, e2, e3) | EIf(e1, e2, e3):
				f(e1);
				f(e2);
				opt2(e3, f);
			case EArrayDecl(el), ENew(_, el), EBlock(el):
				iterArray(el, f);
			case EObjectDecl(fl):
				for (fd in fl)
					f(fd.expr);
			case ECall(e, el):
				f(e);
				iterArray(el, f);
			case EReturn(e):
				opt2(e, f);
			case EFunction(_, func):
				for (arg in func.args)
					opt2(arg.value, f);
				opt2(func.expr, f);
			case ESwitch(e, cl, edef):
				f(e);
				for (c in cl) {
					iterArray(c.values, f);
					opt2(c.guard, f);
					opt2(c.expr, f);
				}
				if (edef != null && edef.def != null)
					f(edef);
		}
	}
    static public function map(e:HaxeExpr, f:HaxeExpr->HaxeExpr):HaxeExpr {
        return {
            t: e.t,
            specialDef: e.specialDef,
            remapTo: e.remapTo,
            def: e.def == null ? null : switch (e.def) {
                case EConst(_): e.def;
                case EArray(e1, e2): EArray(f(e1), f(e2));
                case EBinop(op, e1, e2): EBinop(op, f(e1), f(e2));
                case EField(e, field, kind): EField(f(e), field, kind);
                case EParenthesis(e): EParenthesis(f(e));
                case EObjectDecl(fields):
                    var ret = [];
                    for (field in fields)
                        ret.push({field: field.field, expr: f(field.expr), quotes: field.quotes});
                    EObjectDecl(ret);
                case EArrayDecl(el): EArrayDecl(mapArray(el, f));
                case ECall(e, params): ECall(f(e), mapArray(params, f));
                case ENew(tp, params): ENew(tp, mapArray(params, f));
                case EUnop(op, postFix, e): EUnop(op, postFix, f(e));
                case EVars(vars):
                    var ret = [];
                    for (v in vars) {
                        var v2:HaxeVar = {name: v.name, type: v.type, expr: opt(v.expr, f)};
                        if (v.isFinal != null)
                            v2.isFinal = v.isFinal;
                        if (v.isStatic != null)
                            v2.isStatic = v.isStatic;
                        ret.push(v2);
                    }
                    EVars(ret);
                case EBlock(el): EBlock(mapArray(el, f));
                case EFor(it, expr): EFor(f(it), f(expr));
                case EIf(econd, eif, eelse): EIf(f(econd), f(eif), opt(eelse, f));
                case EWhile(econd, e, normalWhile): EWhile(f(econd), f(e), normalWhile);
                case EReturn(e): EReturn(opt(e, f));
                case EUntyped(e): EUntyped(f(e));
                case EThrow(e): EThrow(f(e));
                case ECast(e, t): ECast(f(e), t);
                case EIs(e, t): EIs(f(e), t);
                case EDisplay(e, dk): EDisplay(f(e), dk);
                case ETernary(econd, eif, eelse): ETernary(f(econd), f(eif), f(eelse));
                case ECheckType(e, t): ECheckType(f(e), t);
                case EContinue, EBreak:
                    e.def;
                case ETry(e, catches):
                    var ret = [];
                    for (c in catches)
                        ret.push({name: c.name, type: c.type, expr: f(c.expr)});
                    ETry(f(e), ret);
                case ESwitch(e, cases, edef):
                    var ret = [];
                    for (c in cases)
                        ret.push({expr: opt(c.expr, f), guard: opt(c.guard, f), values: mapArray(c.values, f)});
                    ESwitch(f(e), ret, edef == null || edef.def == null ? edef : f(edef));
                case EFunction(kind, func):
                    /*var ret = [];
                    for (arg in func.args)
                        ret.push({
                            name: arg.name,
                            opt: arg.opt,
                            type: arg.type,
                            value: opt(arg.value, f)
                        });
                    EFunction(kind, {
                        args: ret,
                        ret: func.ret,
                        params: func.params,
                        expr: f(func.def)
                    });*/
                    // TODO FIX
                    throw "not implemented";
                case EMeta(m, e): EMeta(m, f(e));
            }
        };
    }
    public static function stringToExprDef(s:String):ExprDef {
        final input = byte.ByteData.ofString(s);
        final parser = new haxeparser.HaxeParser(input, s);
        final expr = parser.expr().expr;
        return expr;
    }
    public static function stringToComplexType(s:String):ComplexType {
        s = '(_ : $s)';
        final expr = stringToExprDef(s);
        final t:ComplexType = switch expr {
            case EParenthesis({pos: _, expr: ECheckType(_, t)}):
                t;
            default:
                throw "invalid expr: " + expr;
        }
        return t;
    }
}