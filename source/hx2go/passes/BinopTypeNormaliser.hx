package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.util.TypeHelper;
import hx2go.hxb.HxbType;
import hx2go.util.ExprHelper;

class BinopTypeNormaliser implements ICompilerPass {

    private var context: Context;

    public function new(context: Context) {
        this.context = context;
    }

    private function checkTypes(left: HxbTypedExpr, right: HxbTypedExpr): Void {
        var result: { from: HxbTypedExpr, to: HxbTypedExpr } = switch [left.t, right.t] {
            case [TInt, TFloat]: {
                from: left,
                to: ExprHelper.createCast(context, left, TFloat)
            };

            case _: null;
        }

        if (result == null) {
            return;
        }

        result.from.expr = result.to.expr;
        result.from.t = result.to.t;
    }

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TBinop(op, left, right): !TypeHelper.compare(left.t, right.t);
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, type: HxbModuleType): Void {
        var exprs = switch expr.expr {
            case TBinop(op, left, right): [left, right];
            case _: null;
        }

        if (exprs == null) {
            return;
        }

        checkTypes(exprs[0], exprs[1]); // x + y
        checkTypes(exprs[1], exprs[0]); // y + x
    }

}