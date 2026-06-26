package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.HxbType;
import hx2go.util.ExprHelper;
import hx2go.hxb.Typed.HxbVarKind;
import hx2go.hxb.Typed.HxbVar;
import hx2go.util.TypeHelper;
import hx2go.normaliser.Semantics;
import hx2go.util.StringConversions;

class CastClass extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr {
            case { expr: TCast({ t: TInst(_) }, _), t: TInst(_) }: true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr {
            case { expr: TCast(e, _), t: TInst(tp, _) }:
                var m = context.resolve(tp);
                if (m == null) {
                    return;
                }

                var cls = switch m {
                    case MClass(x): x;
                    case _: return;
                }

                expr.expr = ExprHelper.createUntyped('&{0}.${StringConversions.typePathClassInstanceName(cls.path)}', [e]).expr;

            case _: null;
        }
    }

}
