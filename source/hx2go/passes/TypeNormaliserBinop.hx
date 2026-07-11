package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.util.TypeHelper;
import hx2go.util.ExprHelper;
import hx2go.normaliser.Semantics;
import hx2go.hxb.Ast.HxbBinop;

class TypeNormaliserBinop extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TBinop(op, left, right): !TypeHelper.compare(left.t, expr.t) || !TypeHelper.compare(right.t, expr.t) || op == OpDiv;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
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

        var toType = TypeHelper.compare(expr.t, TBool) ? TypeHelper.commonType(context, left.t, right.t) : expr.t;
        if (!TypeHelper.compare(left.t, toType) && op != OpAssign) {
            var o = ExprHelper.createCast(left, toType);
            left.expr = o.expr;
            left.t = o.t;
            context.submitNode(left, true);
        }

        // NOTE: this also handles OpAssign, since the resulting type of the assign expr always equals the left side, only RHS will be casted if needed.
        if (!TypeHelper.compare(right.t, toType)) {
            var o = ExprHelper.createCast(right, toType);
            right.expr = o.expr;
            right.t = o.t;
            context.submitNode(right, true);
        }
    }

}