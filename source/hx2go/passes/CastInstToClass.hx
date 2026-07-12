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
import hx2go.hxb.flags.HxbClassFlag;
import haxe.runtime.Copy;
import hx2go.hxb.Typed.HxbFieldAccess;

class CastInstToClass extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr {
            case { expr: TCast({ t: TInst(_) | TDynamic(_) | TDynamicAny }, _), t: TAbstract({ name: "Class", pack: [] }, _) }: true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr {
            case { expr: TCast(e, _), t: TAbstract({ name: "Class", pack: [] }, _) }: {
                var isDyn = e.t.match(TDynamicAny | TDynamic(_));
                var o = new HxbTypedExpr(TCall(
                    new HxbTypedExpr(
                        TField(Copy.copy(e), isDyn ? FDynamic("_RTTI") : FInstance(switch e.t {
                            case TInst(tp, _): tp;
                            case _: return;
                        }, [], {
                            owner: null,
                            kind: FRMember,
                            name: "Hx_Field__RTTI",
                            depth: 0
                        })),
                        TDynamicAny, // don't care
                        expr.pos
                    ),
                    []
                ), expr.t, expr.pos);

                expr.expr = o.expr;

                context.submitNode(expr, true);
            }

            case _: null;
        }
    }

}
