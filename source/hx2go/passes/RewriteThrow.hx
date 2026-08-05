package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.HxbModuleType;
import hxb.Typed.HxbTypedExprDef;
import hxb.HxbType;
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
            case TThrow(e):
                // ExprHelper.createCallStatic(context, { name: 'Go', moduleName: 'Go', pack: ['go'] }, 'panic', [ Copy.copy(e) ]);
                var arg = ExprHelper.createCallStatic(context, { name: 'Exception', moduleName: 'Exception', pack: ["haxe"]}, 'thrown', [ Copy.copy(e)]);
                ExprHelper.createCallStatic(context, { name: 'Go', moduleName: 'Go', pack: ['go'] }, 'panic', [ arg ]);
            case _: expr;
        }

        expr.expr = o.expr;
        expr.t = o.t;

        context.submitNode(expr, true);
    }

}