package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;

class AppendSmileyToString implements ICompilerPass {

    private var context: Context;

    public function new(context: Context) {
        this.context = context;
    }

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TConst(TString(_)): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr): Void {
        expr.expr = switch expr.expr {
            case TConst(TString(existing)): TConst(TString('$existing :D'));
            case _: expr.expr;
        }
    }

}
