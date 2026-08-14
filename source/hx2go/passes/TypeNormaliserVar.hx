package hx2go.passes;

import hx2go.normaliser.Semantics;
import hxb.Typed.HxbTypedExpr;
import hxb.HxbModuleType;
import hx2go.util.TypeHelper;
import hx2go.util.ExprHelper;
import hxb.HxbClassField;
import hxb.HxbType;

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
                if (!Semantics.isNullableType(context, v.type) && isErasedNull(e)) {
                    e.expr = ExprHelper.createUntyped('{0}.Value', [hx2go.normaliser.ExprCopy.copy(e)]).expr;
                    return;
                }
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

    function isErasedNull(e:HxbTypedExpr):Bool {
        return switch e.expr {
            case TLocal(v): 
                Semantics.isNullableType(context, v.type) && !Semantics.isNullableType(context, e.t);
            default: false;
        }
    }
}