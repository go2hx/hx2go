package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.HxbModuleType;
import hxb.Typed.HxbTypedExprDef;
import hxb.HxbType;
import hx2go.util.ExprHelper;

class CastString extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        if (expr.t == null) {
            return false;
        }

        return switch [expr.expr, expr.t] {
            case [
                TCast(_, _),
                TString | TAbstract({ name: "String", pack: [] }, _)
            ]: true;

            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TCast(e, _) if (e != null && isPlainString(e.t)):
                expr.expr = e.expr;
                expr.t = e.t;
                context.submitNode(expr);

            case TCast(e, _):
                var o = ExprHelper.createCallStatic(context, { pack: [], name: 'Std', moduleName: 'Std' }, 'string', [e]);
                expr.expr = o.expr;
                expr.t = o.t;

            case _:
        }
    }

    function isPlainString(t: HxbType): Bool {
        if (t == null) {
            return false;
        }
        return context.getWriter().types.writeHxbType(t).toString() == "string";
    }

}
