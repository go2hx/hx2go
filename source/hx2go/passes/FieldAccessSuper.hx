package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.HxbType;
import hx2go.util.ExprHelper;
import haxe.runtime.Copy;
import hx2go.util.StringConversions;
import hx2go.util.StringConversions.StringConversions.typePathClassInstanceName;
import hx2go.hxb.Typed.HxbFieldAccess;

class FieldAccessSuper extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TCall({ expr: TField({ expr: TConst(TSuper) }, _) }, _): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TCall({ expr: TField({ expr: TConst(TSuper), t: TInst(tp, _), pos: pos }, FInstance(fa_tp, fa_t, fa_cf)) }, args): {
                var m = context.resolve(tp);
                if (m == null) {
                    return;
                }

                var base = switch m {
                    case MClass(x): x;
                    case _: null;
                }

                expr.expr = TCall(new HxbTypedExpr(TField(ExprHelper.createUntyped('{0}.${StringConversions.typePathClassInstanceName(base.path)}', [
                    new HxbTypedExpr(TConst(TThis), null, null),
                ]), FInstance(fa_tp, fa_t, {
                    name: StringConversions.nameToFieldName(fa_cf.name),
                    owner: fa_cf.owner,
                    depth: fa_cf.depth,
                    kind: fa_cf.kind
                })), null, null), args);
            };

            case _: null;
        }
    }

}