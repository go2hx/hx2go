package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.HxbType;

class StringificationCast implements ICompilerPass {

    private var context: Context;

    public function new(context: Context) {
        this.context = context;
    }

    public function match(expr: HxbTypedExpr): Bool {
        return switch [expr.expr, expr.t] {
            case [
                TCast(_, _),
                TString | TAbstract({ name: "String", moduleName: "String", pack: [] }, _)
            ]: true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, type: HxbModuleType): Void {
        trace(expr);
    }

}