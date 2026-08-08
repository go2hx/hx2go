package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.HxbModuleType;
import hx2go.util.TypeHelper;
import hx2go.util.ExprHelper;
import hx2go.normaliser.Semantics;
import hxb.Ast.HxbBinop;
import hxb.HxbType;
import haxe.runtime.Copy;

class NullableCompare extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TBinop(OpEq | OpNotEq, left, right):
                Semantics.isNullableExpr(context, left) || Semantics.isNullableExpr(context, right);

            case _: false;
        }
    }

    public function executeSide(right: HxbTypedExpr, left: HxbTypedExpr): Void {
        var boxed = Semantics.isNullableExpr(context, left);

        switch right.expr {
            case TConst(TNull):
                var local_cmp = Copy.copy(left);
                left.expr = if (boxed) {
                    ExprHelper.createUntyped("{0}.Valid", [local_cmp]).expr;
                } else switch left.t {
                    case TInt: {
                        local_cmp = ExprHelper.createCast(local_cmp, TAbstract({ pack: [], name: 'Null', moduleName: 'Null' }, [ left.t ]));
                        ExprHelper.createUntyped("{0}.Valid", [local_cmp]).expr;
                    }
                    case _: new HxbTypedExpr(TBinop(
                        OpNotEq,
                        local_cmp,
                        new HxbTypedExpr(TConst(TNull), local_cmp.t, local_cmp.pos)
                    ), TBool, left.pos).expr;
                }

                left.t = TBool;
                right.expr = TConst(TBool(false));
                right.t = TBool;
                context.submitNode(left, true);

            case TConst(_):
                var local_cmp = Copy.copy(left);
                if (boxed) {
                    left.expr = ExprHelper.createUntyped("{0}.Value", [local_cmp]).expr;

                    var payload = Semantics.getNullableType(context, left.t);
                    if (payload != null) {
                        left.t = payload;
                    }
                } else {
                    left.expr = local_cmp.expr;
                }

                context.submitNode(left, true);

            case _: null;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        var left: HxbTypedExpr = null;
        var right: HxbTypedExpr = null;

        var op: HxbBinop = null;

        switch expr.expr {
            case TBinop(b_op, b_left, b_right):
                op = b_op;
                left = b_left;
                right = b_right;

            case _: return;
        }

        // both sides boxed
        if (!left.expr.match(TConst(_)) && !right.expr.match(TConst(_))
            && Semantics.isNullableExpr(context, left) && Semantics.isNullableExpr(context, right)) {
            var eq = op == OpEq;
            var valid = e -> {
                var v = ExprHelper.createUntyped("{0}.Valid", [Copy.copy(e)]);
                v.t = TBool;
                v;
            };
            var bin = (o: HxbBinop, l, r) -> new HxbTypedExpr(TBinop(o, l, r), TBool, expr.pos);

            expr.expr = TParenthesis(bin(
                eq ? OpBoolAnd : OpBoolOr,
                bin(op, valid(left), valid(right)),
                bin(
                    eq ? OpBoolOr : OpBoolAnd,
                    bin(OpEq, valid(left), new HxbTypedExpr(TConst(TBool(!eq)), TBool, expr.pos)),
                    Copy.copy(expr)
                )
            ));
            expr.t = TBool;

            context.submitNode(expr, true, 1);
            return;
        }

        executeSide(left, right);
        executeSide(right, left);
    }

}