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

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        expr.expr = switch expr.expr {
            case TCast(e, _): e.expr;
            case _: expr.expr;
        }
    }

}