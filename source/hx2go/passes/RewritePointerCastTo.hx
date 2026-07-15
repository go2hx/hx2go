package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.HxbType;
import hx2go.util.ExprHelper;
import hx2go.util.TypeHelper;
import haxe.runtime.Copy;

class RewritePointerCastTo extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        if (expr.t == null) {
            return false;
        }

        return switch [expr.expr, expr.t] {
            case [TCast({ t: t }, _), TAbstract({ name: "Pointer", pack: ["go"] }, params)] if (TypeHelper.compare(params[0], t)): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TCast(e, _): {
                var o = ExprHelper.createUntyped("(&{0})", [e]);
                expr.expr = o.expr;
                expr.t = o.t;
            }

            case _: null;
        }
    }

}