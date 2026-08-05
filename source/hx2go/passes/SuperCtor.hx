package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.HxbModuleType;
import hxb.Typed.HxbTypedExprDef;
import hxb.HxbType;
import hx2go.util.ExprHelper;
import haxe.runtime.Copy;
import hx2go.util.StringConversions;

class SuperCtor extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TCall({ expr: TConst(TSuper) }, _): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TCall({ expr: TConst(TSuper), t: TInst(tp, _), pos: pos }, params): {
                var m = context.resolve(tp);
                if (m == null) {
                    return;
                }

                var base = switch m {
                    case MClass(x): x;
                    case _: null;
                }

                expr.expr = TCall(ExprHelper.createUntyped('{0}.${StringConversions.typePathClassInstanceName(base.path)}.Hx_New', [
                    new HxbTypedExpr(TConst(TThis), null, null),
                ]), params);
            }

            case _: null;
        }
    }

}