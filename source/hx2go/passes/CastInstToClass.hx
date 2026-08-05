package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.HxbModuleType;
import hxb.Typed.HxbTypedExprDef;
import hxb.HxbType;
import hx2go.util.ExprHelper;
import hxb.Typed.HxbVarKind;
import hxb.Typed.HxbVar;
import hx2go.util.TypeHelper;
import hx2go.normaliser.Semantics;
import hx2go.util.StringConversions;
import hxb.flags.HxbClassFlag;
import haxe.runtime.Copy;
import hxb.Typed.HxbFieldAccess;

class CastInstToClass extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr {
            case { expr: TCast({ t: TInst(_) | TDynamic(_) | TDynamicAny }, _), t: TAbstract({ name: "Class", pack: [] }, _) }: true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr {
            case { expr: TCast(e, _), t: t }: {
                var isDyn = e.t.match(TDynamicAny | TDynamic(_));
                var o = ExprHelper.createCast(new HxbTypedExpr(TCall(
                    new HxbTypedExpr(
                        TField(Copy.copy(e), isDyn ? FDynamic("_RTTI") : FInstance(switch e.t {
                            case TInst(tp, _): tp;
                            case _: return;
                        }, [], {
                            owner: null,
                            kind: FRMember,
                            name: "_RTTI",
                            depth: 0
                        })),
                        TFun([], TInst({ name: "HxClass", moduleName: "HxClass", pack: ['go', 'haxe'] }, [])),
                        expr.pos
                    ),
                    []
                ), expr.t, expr.pos), t);

                expr.expr = o.expr;
                expr.t = o.t;

                context.submitNode(expr, true, 1);
            }

            case _: null;
        }
    }

}
