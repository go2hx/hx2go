package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.util.TypeHelper;
import hx2go.util.ExprHelper;

class TypeNormaliserBinop extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TBinop(op, left, right): !TypeHelper.compare(left.t, right.t);
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, type: HxbModuleType): Void {
        var left: HxbTypedExpr = null;
        var right: HxbTypedExpr = null;

        switch expr.expr {
            case TBinop(_, b_left, b_right):
                left = b_left;
                right = b_right;

            case _: null;
        }

        if (left == null || right == null) {
            return;
        }

        if (!TypeHelper.compare(left.t, expr.t)) {
            var o = ExprHelper.createCast(context, left, expr.t);
            left.expr = o.expr;
            left.t = o.t;
        }

        if (!TypeHelper.compare(right.t, expr.t)) {
            var o = ExprHelper.createCast(context, right, expr.t);
            right.expr = o.expr;
            right.t = o.t;
        }
    }

}