package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.HxbType;
import hx2go.util.ExprHelper;

class StringificationCast extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch [expr.expr, expr.t] {
            case [
                TCast(_, _),
                TString | TAbstract({ name: "String", pack: [] }, _)
            ]: true;

            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, type: HxbModuleType): Void {
        var o = switch expr.expr {
            case TCast(e, _):
                ExprHelper.createCallStatic(context, { pack: [], name: 'Std', moduleName: 'Std' }, 'string', [e]);

            case _: expr;
        }

        expr.expr = o.expr;
        expr.t = o.t;

        context.submitNode(expr, true);
    }

}