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

class CastInstToEnum extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr {
            case { expr: TCast({ t: TEnum(_) | TDynamic(_) | TDynamicAny }, _), t: TAbstract({ name: "Enum", pack: [] }, _) | TEnumStatic(_) }: true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr {
            case { expr: TCast(e, _), t: TAbstract({ name: "Enum", pack: [] }, _) | TEnumStatic(_) }: {
                var isDyn = e.t.match(TDynamicAny | TDynamic(_));
                var o = new HxbTypedExpr(TCall(
                    new HxbTypedExpr(
                    TField(Copy.copy(e), isDyn ? FDynamic("enumType") : FInstance(switch e.t {
                        case TEnum(tp, _): tp;
                        case _: return;
                    }, [], {
                        owner: null,
                        kind: FRMember,
                        name: "Hx_Field_enumType",
                        depth: 0
                    })),
                    TFun([], TInst({ name: "HxEnum", moduleName: "HxEnum", pack: ['go', 'haxe'] }, [])),
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
