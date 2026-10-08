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
			case TBinop(OpAdd, a, b) if (a.t.match(TString) && b.t.match(TString)): true;
			case _: false;
		}
	}

	public function execute(expr:HxbTypedExpr, frame:ContextFrame):Void {
		switch expr.expr {
			case TBinop(op, left, right):
				{
					var o = ExprHelper.createCallStatic(context, {pack: ["go", "haxe"], name: 'HxDynamic', moduleName: 'HxDynamic'}, 'stringConcat',
						[left, right]);
					expr.expr = o.expr;
					expr.t = o.t;
				}
			case _: 
                null;
		}
	}
}
