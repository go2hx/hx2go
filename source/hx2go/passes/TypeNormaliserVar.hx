package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.util.TypeHelper;
import hx2go.util.ExprHelper;
import hx2go.hxb.HxbClassField;
import hx2go.hxb.HxbType;

class TypeNormaliserVar extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TVar(_, e) if (e != null): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TVar(v, e): {
                if (TypeHelper.compare(v.type, e.t)) {
                    return;
                }

                var o = ExprHelper.createCast(e, v.type);
                e.expr = o.expr;
                e.t = o.t;

                context.submitNode(e, true);
            };

            case _: null;
        }
    }

}