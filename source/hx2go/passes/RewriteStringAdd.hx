package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.HxbModuleType;
import hxb.Typed.HxbTypedExprDef;
import hx2go.util.ExprHelper;
import hxb.HxbType;
import hxb.Ast.HxbBinop;

class RewriteStringAdd extends CompilerPass {
	public function match(expr:HxbTypedExpr):Bool {
		return switch expr.expr {
			case TBinop(OpAdd, a, b) if (isString(a.t) && isString(b.t)): true;
			case TBinop(OpAssignOp(OpAdd), a, b) if (isString(a.t) && isString(b.t) && !hx2go.normaliser.Semantics.hasSideEffects(a)): true;
			case _: false;
		}
	}

	static function isString(t:HxbType):Bool {
		return t != null && t.match(TString | TAbstract({pack: [], name: "Null"}, [TString]));
	}

	function concat(left:HxbTypedExpr, right:HxbTypedExpr):HxbTypedExpr {
		return ExprHelper.createCallStatic(context, {pack: ["go", "haxe"], name: 'HxString', moduleName: 'HxString'}, 'concat', [left, right]);
	}

	public function execute(expr:HxbTypedExpr, frame:ContextFrame):Void {
		switch expr.expr {
			case TBinop(OpAssignOp(OpAdd), left, right):
				{
					expr.expr = TBinop(OpAssign, left, concat(hx2go.normaliser.ExprCopy.copy(left), right));
				}
			case TBinop(op, left, right):
				{
					var o = concat(left, right);
					expr.expr = o.expr;
					expr.t = o.t;
				}
			case _: 
                null;
		}
	}
}
