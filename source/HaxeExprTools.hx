package;

import haxe.macro.Expr;
import HaxeExpr.HaxeVar;
import haxe.macro.Expr.ComplexType;
import haxe.macro.ComplexTypeTools;
import haxe.CallStack;

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
			case EConst(_), EGoSliceConstruct(_), EContinue, EBreak:
			case EGoEnumIndex(e), EGoEnumParameter(e, _, _), EField(e, _), EParenthesis(e), EUntyped(e), EThrow(e), EDisplay(e, _), ECheckType(e, _), EUnop(_, _, e), ECast(e, _), EIs(e, _), EMeta(_, e):
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
			case ETernary(e1, e2, e3), EIf(e1, e2, e3):
				f(e1);
				f(e2);
				opt2(e3, f);
			case EArrayDecl(el, _), ENew(_, el), EBlock(el):
				iterArray(el, f);
			case EObjectDecl(fl):
				for (fd in fl)
					f(fd.expr);
			case ECall(e, el):
				f(e);
				iterArray(el, f);
			case EReturn(e):
				opt2(e, f);
			case EGoCode(_, el):
			    iterArray(el, f);
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
   	public static function stringToExprDef(s:String):ExprDef {
		try {
			final input = byte.ByteData.ofString(s);
			final parser = new haxeparser.HaxeParser(input, s);
			final expr = parser.expr().expr;
			if (expr == null) {
				Logging.exprTools.error(s);
				throw "expr is null";
			}
			return expr;
		} catch (e:Dynamic) {
			Logging.exprTools.error("HaxeExprTools.stringToExprDef parse error!, e: " + Std.string(e) + " s: " + s);
			return EMeta({ pos: null, name: "ParseError" }, null);
		}
    }

	private static function cleanUpModularPath(s:String):String {
		// (_ : Array<haxe._Rest.NativeRest.T>) -> (_ : Array<haxe._RestNativeRest.T>) 
		// to allow Haxe Parser to properly handle name and sub
		final elems = s.split(".");
		// Not needed if modular path is not over pack, name, sub limit
		if (elems.length < 3)
			return s;
		var addToNext = "";
		var wasUppercase = false;
		var removal = [];
		for (i in 0...elems.length) {
			final isUppercase = elems[i].charAt(0).toUpperCase() == elems[i].charAt(0);
			if (addToNext != "" && isUppercase) {
				elems[i] = addToNext + elems[i];
				addToNext = "";
				continue;
			}else if (elems[i].charAt(0) == "_") {
				addToNext = elems[i];
				removal.push(elems[i]);
			}
			wasUppercase = isUppercase;
		}
		// remove all marked moved elems
		for (elem in removal) {
			elems.remove(elem);
		}
		// put back together
		return elems.join(".");
	}

    public static function stringToComplexType(s:String):ComplexType {
		// temporary fix to prevent parsing error of for example:
		// (_ : (this : EnumValue, pattern : Dynamic) -> Bool)
		// `this` would cause a parser error so we replace it with `this2`
		final originalString = s;
		s = StringTools.replace(s, "this", "this2");
		s = cleanUpModularPath(s);
        s = '(_ : $s)';
        final expr = stringToExprDef(s);
		if (expr == null)
			return TPath({pack: [], name: "#NULL_COMPLEXTYPE_EXPR"});
        final t:ComplexType = switch expr {
            case EParenthesis({pos: _, expr: ECheckType(_, t)}):
                t;
            default:
				trace(originalString);
				Logging.exprTools.error("HaxeExprTools.stringToComplexType parse error! s: " + s + " expr: " + expr);
				HaxeExprTools.stringToComplexType("ParsingError");
                // throw "invalid expr: " + expr + " in s: " + s;
        }
        return t;
    }
	public static function typeOfParam(p: TypeParam): ComplexType {
		return switch (p) {
			case TPType(t): t;
			case TPExpr(_): {
				Logging.exprTools.warn('cannot get type of TPExpr');
				null;
			}
		}
	}
	public static function copyType(t: ComplexType): ComplexType {
		if (t == null) {
			return null;
		}

		return HaxeExprTools.stringToComplexType(ComplexTypeTools.toString(t)); // mikaib: evil hack, sorry :(
	}
	public static function compareType(a: ComplexType, b: ComplexType): Bool {
		return ComplexTypeTools.toString(a) == ComplexTypeTools.toString(b); // mikaib: evil hack, sorry :(
	}
}
