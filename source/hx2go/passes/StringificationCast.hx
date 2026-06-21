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
        context.defineImport(type, "fmt");

        expr.expr = switch expr.expr {
            case TCast(e, _):
                ExprHelper.createUntyped('fmt.Sprintf("%v", {0})', [e]).expr;

            case _: expr.expr;
        }
    }

}