package hx2go.passes;

import haxe.runtime.Copy;
import hxb.Typed.HxbTypedExpr;
import hxb.HxbModuleType;
import hx2go.util.TypeHelper;
import hx2go.util.ExprHelper;
import hx2go.normaliser.Semantics;
import hxb.Ast.HxbBinop;

class TypeNormaliserBinop extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool { 
        // match unconditionally in case generic erasure occurs after
        return switch expr.expr {
            case TBinop(_, _, _): true;
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

        switch [op, left.expr] {
            case [OpAssign | OpAssignOp(_), TCast(inner, _)] if (inner.t.match(TDynamicAny | TDynamic(_))):
                left.expr = inner.expr;
                left.t = inner.t;

            case _:
        }

        if (TypeHelper.compare(expr.t, TBool) && op != OpAssign) {
            if (Semantics.isNullableType(context, left.t)) {
                var o = ExprHelper.createCast(left, Semantics.getNullableType(context, left.t));
                left.expr = o.expr;
                left.t = o.t;
                context.submitNode(left, true);
            }

            if (Semantics.isNullableType(context, right.t)) {
                var o = ExprHelper.createCast(right, Semantics.getNullableType(context, right.t));
                right.expr = o.expr;
                right.t = o.t;
                context.submitNode(right, true);
            }
            switch [left.t, right.t] {
                case [TInst(c, _), TInst(c2, _)]:
                    if (ExprHelper.isBaseOf(context, context.resolvedInstanceName(c), c2)) {
                        var o = ExprHelper.createCast(right, left.t);
                        right.expr = o.expr;
                        right.t = o.t;
                        context.submitNode(right, true);
                    }

                    if (ExprHelper.isBaseOf(context, context.resolvedInstanceName(c2), c)) {
                        var o = ExprHelper.createCast(left, right.t);
                        left.expr = o.expr;
                        left.t = o.t;
                        context.submitNode(left, true);
                    }
                case [TInt, TFloat]:
                    var o = ExprHelper.createCast(left, TFloat);
                    left.expr = o.expr;
                    left.t = o.t;
                    context.submitNode(left, true);

                case [TFloat, TInt]:
                    var o = ExprHelper.createCast(right, TFloat);
                    right.expr = o.expr;
                    right.t = o.t;
                    context.submitNode(right, true);

                case _: // may wanna default to enforcing to cast to lhs or rhs?
            }

            return;
        }

        if (op.match(OpAssignOp(_)) && Semantics.isNullableType(context, expr.t)) {
            expr.t = Semantics.getNullableType(context, expr.t);
        }

        var castLeft = !TypeHelper.compare(left.t, expr.t) && switch op {
            case OpAssign: false;
            case OpAssignOp(_): Semantics.isNullableType(context, left.t);
            case _: true;
        };

        if (castLeft) {
            var o = ExprHelper.createCast(left, expr.t);
            left.expr = o.expr;
            left.t = o.t;
            context.submitNode(left, true);
        }

        var rightTarget = switch op {
            case OpAssign | OpAssignOp(_): left.t;
            case _: expr.t;
        }

        if (!TypeHelper.compare(right.t, rightTarget)) {
            var o = ExprHelper.createCast(right, rightTarget);
            right.expr = o.expr;
            right.t = o.t;
            context.submitNode(right, true);
        }
        if (op == OpDiv && !Semantics.isInt64Type(context, expr.t)) {
            var o = ExprHelper.createCast(expr, TFloat);
            expr.expr = o.expr;
            expr.t = o.t;
            context.submitNode(expr, true, 1);
        }
    }

}