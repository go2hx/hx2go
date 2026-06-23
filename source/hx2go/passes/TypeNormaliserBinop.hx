package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.util.TypeHelper;
import hx2go.util.ExprHelper;
import hx2go.preprocessor.Semantics;
import hx2go.hxb.Ast.HxbBinop;

class TypeNormaliserBinop extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TBinop(op, left, right): !TypeHelper.compare(left.t, right.t) || op == OpDiv;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, type: HxbModuleType): Void {
        var left: HxbTypedExpr = null;
        var right: HxbTypedExpr = null;
        var op: HxbBinop = null;

        switch expr.expr {
            case TBinop(b_op, b_left, b_right):
                left = b_left;
                right = b_right;
                op = b_op;

            case _: null;
        }

        if (left == null || right == null) {
            return;
        }

        if (!TypeHelper.compare(left.t, expr.t) && op != OpAssign) {
            var o = ExprHelper.createCast(left, expr.t);
            left.expr = o.expr;
            left.t = o.t;
            context.submitNode(left, true);
        }

        // NOTE: this also handles OpAssign, since the resulting type of the assign expr always equals the left side, only RHS will be casted if needed.
        if (!TypeHelper.compare(right.t, expr.t)) {
            var o = ExprHelper.createCast(right, expr.t);
            right.expr = o.expr;
            right.t = o.t;
            context.submitNode(right, true);
        }
    }

}