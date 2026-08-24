package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.HxbModuleType;
import hxb.Typed.HxbTypedExprDef;
import hxb.HxbType;
import hx2go.util.ExprHelper;

class CastArray extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr {
            case { expr: TCast({ t: TInst({ name: 'Array', pack: [] }, _) }, _), t: TInst({ name: 'Array', pack: [] }, _) }: true;
            case _: false;
        }
    }

    public function elem(t: HxbType): HxbType {
        return switch t {
            case TInst({ name: "Array", pack: [] }, [elem]): elem;
            case _: t;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        expr.expr = switch expr.expr {
            case TCast(e, _) if (elem(expr.t).match(TDynamic(_) | TDynamicAny) && !elem(e.t).match(TDynamic(_) | TDynamicAny)):
                ExprHelper.createUntyped("{0}.Dyn()", [e]).expr;

            case TCast(e, _):
                e.expr;

            case _:
                expr.expr;
        }
    }

}