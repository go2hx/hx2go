package hx2go.passes;

import hxb.Typed.HxbTypedExpr;

class RewriteString implements ICompilerPass {

    private var context: Context;

    public function new(context: Context) {
        this.context = context;
    }

    public function match(expr: HxbTypedExpr): Bool {
        return switch (expr.expr) {
            case TConst(TString(_)): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr): Void {
        expr.expr = TConst(TString("Cool String!!"));
    }

}
