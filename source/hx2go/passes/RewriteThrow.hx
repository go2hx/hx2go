package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.HxbType;
import hx2go.util.ExprHelper;
import haxe.runtime.Copy;

class RewriteThrow extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TThrow(_): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        var o = switch expr.expr {
            case TThrow(e): ExprHelper.createCallStatic(context, { name: 'Go', moduleName: 'Go', pack: ['go'] }, 'panic', [ Copy.copy(e) ]);
            case _: expr;
        }

        expr.expr = o.expr;
        expr.t = o.t;

        context.submitNode(expr, true);
    }

}