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
import hxb.Typed.HxbFieldAccess;

class CastInstToEnum extends CompilerPass {

    static function isTypeExpr(e: HxbTypedExpr): Bool {
        return switch e.expr {
            case TTypeExpr(_): true;
            case TCast(inner, _) | TParenthesis(inner) | TMeta(_, inner): isTypeExpr(inner);
            case _: false;
        }
    }

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr {
            case { expr: TCast({ t: TAbstract({ name: "EnumValue", pack: [] }, _) | TEnum(_) | TDynamic(_) | TDynamicAny }, _), t: TAbstract({ name: "Enum", pack: [] }, _) | TEnumStatic(_) }: true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr {
            case { expr: TCast(e, _), t: t }: {
                var isDyn = e.t.match(TDynamicAny | TDynamic(_));
                // use directly, no need to get enumType
                if (isDyn && isTypeExpr(e)) {
                    return;
                }
                var o = ExprHelper.createCast(new HxbTypedExpr(TCall(
                    new HxbTypedExpr(
                    TField(hx2go.normaliser.ExprCopy.copy(e), isDyn ? FDynamic("enumType") : FInstance(switch e.t {
                        case TEnum(tp, _) | TAbstract(tp, _): tp;
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
                ), expr.t, expr.pos), t);

                expr.expr = o.expr;
                expr.t = o.t;

                context.submitNode(expr, true, 1);
            }

            case _: null;
        }
    }

}
