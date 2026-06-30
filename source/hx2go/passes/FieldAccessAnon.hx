package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.Typed.HxbFieldAccess;
import haxe.runtime.Copy;

class FieldAccessAnon extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TField(_, FAnon(_)): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TField(e, FAnon(cf)):
                expr.expr = TField(Copy.copy(e), FDynamic(cf.name));
                expr.t = TDynamicAny;
                context.submitNode(expr, true);

            case _: null;
        }
    }

}