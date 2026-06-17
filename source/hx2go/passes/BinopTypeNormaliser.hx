package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.util.TypeHelper;
import hx2go.hxb.HxbType;
import hx2go.util.ExprHelper;
import hx2go.hxb.Ast.HxbBinop;

class BinopTypeNormaliser extends CompilerPass {

    private function checkTypes(self: HxbTypedExpr, op: HxbBinop, left: HxbTypedExpr, right: HxbTypedExpr, swapped: Bool): Void {
        var result: { left: HxbTypedExpr, right: HxbTypedExpr } = switch [left.t, right.t] {
            case [TInt, TFloat]: {
                left: ExprHelper.createCast(context, left, TFloat),
                right: right
            };

            case [_, TString]: {
                left: ExprHelper.createCast(context, left, TString),
                right: right
            };

            case _: null;
        }

        if (result == null) {
            return;
        }

        self.expr = swapped ? TBinop(op, result.right, result.left) : TBinop(op, result.left, result.right);
    }

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TBinop(op, left, right): !TypeHelper.compare(left.t, right.t);
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, type: HxbModuleType): Void {
        var op: HxbBinop = OpAdd;
        var left: HxbTypedExpr = null;
        var right: HxbTypedExpr = null;

        switch expr.expr {
            case TBinop(b_op, b_left, b_right): {
                op = b_op;
                left = b_left;
                right = b_right;
            }

            case _: null;
        }

        if (left == null || right == null) {
            return;
        }

        checkTypes(expr, op, left, right, false); // x + y
        checkTypes(expr, op, right, left, true); // y + x
    }

}