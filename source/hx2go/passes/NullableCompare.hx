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
            case TBinop(OpEq | OpNotEq | OpGt | OpGte | OpLt | OpLte, left, right):
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

    static function isNullConst(e: HxbTypedExpr): Bool {
        return switch e.expr {
            case TConst(TNull): true;
            case TParenthesis(inner) | TMeta(_, inner) | TCast(inner, _): isNullConst(inner);
            case _: false;
        }
    }
    
    // <, <=, >, >= against null are false, unless both sides are null and the op allows equality
    function executeRelational(expr: HxbTypedExpr, op: HxbBinop, left: HxbTypedExpr, right: HxbTypedExpr): Void {
        var eq = op.match(OpGte | OpLte);
        var opStr = switch op { case OpGt: ">"; case OpGte: ">="; case OpLt: "<"; case _: "<="; }
        var raw = (template: String, args: Array<HxbTypedExpr>) -> ExprHelper.createUntyped(template, args).expr;

        if (isNullConst(left) || isNullConst(right)) {
            var other = isNullConst(left) ? right : left;
            expr.expr = eq && Semantics.isNullableExpr(context, other)
                ? raw("!{0}.Valid", [Copy.copy(other)])
                : TConst(TBool(false));
        } else {
            var leftBoxed = Semantics.isNullableExpr(context, left);
            var rightBoxed = Semantics.isNullableExpr(context, right);

            var leftValid = leftBoxed ? "{0}.Valid" : "true";
            var rightValid = rightBoxed ? "{1}.Valid" : "true";
            var leftValue = leftBoxed ? "{0}.Value" : "{0}";
            var rightValue = rightBoxed ? "{1}.Value" : "{1}";

            expr.expr = raw(
                '($leftValid && $rightValid && ($leftValue $opStr $rightValue)'
                    + (eq ? ' || (!$leftValid && !$rightValid)' : '') + ')',
                [Copy.copy(left), Copy.copy(right)]
            );
        }

        expr.t = TBool;
        context.submitNode(expr, true, 1);
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

        if (op.match(OpGt | OpGte | OpLt | OpLte)) {
            executeRelational(expr, op, left, right);
            return;
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