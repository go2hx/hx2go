package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.HxbModuleType;
import hxb.Typed.HxbTypedExprDef;
import hxb.HxbType;
import hx2go.util.ExprHelper;
import hx2go.util.TypeHelper;

class CastArray extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr {
            case { expr: TCast({ t: from }, _), t: to } if (isArrayType(from) && isArrayType(to)): true;
            case _: false;
        }
    }

    public function isArrayType(t: HxbType): Bool {
        return TypeHelper.followToDef(context, t).match(TInst({ name: 'Array', pack: [] }, _));
    }

    public function elem(t: HxbType): HxbType {
        return switch TypeHelper.followToDef(context, t) {
            case TInst({ name: "Array", pack: [] }, [elem]): elem;
            case _: t;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        expr.expr = switch expr.expr {
            case TCast(e, _) if (elem(expr.t).match(TDynamic(_) | TDynamicAny | TTypeParam(_)) && !elem(e.t).match(TDynamic(_) | TDynamicAny | TTypeParam(_))):
                trace(expr, e.t, elem(e.t));
                ExprHelper.createUntyped("{0}.Dyn()", [e]).expr;

            case TCast(e, _) if (elem(e.t).match(TDynamic(_) | TDynamicAny | TTypeParam(_)) && !elem(expr.t).match(TDynamic(_) | TDynamicAny | TTypeParam(_))):
                ExprHelper.createUntyped('HxDynamicArrayAs[${context.getWriter().types.writeHxbType(elem(expr.t))}]({0})', [e]).expr;

            case TCast(e, _):
                e.expr;

            case _:
                expr.expr;
        }
    }

}