package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.HxbModuleType;
import hx2go.util.TypeHelper;
import hx2go.util.ExprHelper;
import hx2go.normaliser.Semantics;
import hxb.Ast.HxbBinop;
import hxb.HxbType;

class NullableCompareValid extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TBinop(OpEq | OpNotEq, left, right) if (isNullLiteral(left) || isNullLiteral(right)):
                false;

            case TBinop(OpEq | OpNotEq, left, right):
                var i = 0;
                i += Semantics.isNullableExpr(context, left) ? 1 : 0;
                i += Semantics.isNullableExpr(context, right) ? 1 : 0;
                i == 1;
            case _: false;
        }
    }

    static function isNullLiteral(e: HxbTypedExpr): Bool {
        if (e == null) {
            return false;
        }

        return switch e.expr {
            case TConst(TNull): true;
            case TParenthesis(inner) | TMeta(_, inner) | TCast(inner, _): isNullLiteral(inner);
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        var left: HxbTypedExpr = null;
        var right: HxbTypedExpr = null;
        var op:HxbBinop = null;
        switch expr.expr {
            case TBinop(b_op, b_left, b_right):
                op = b_op;
                left = b_left;
                right = b_right;
            case _: return;
        }
        var nullValue = if (Semantics.isNullableExpr(context, left)) {
            left;
        }else if (Semantics.isNullableExpr(context, right)){
            right;
        }else{
            return;
        }
        var nullCheckExpr = ExprHelper.createUntyped("{0}.Valid", [hx2go.normaliser.ExprCopy.copy(nullValue)]);
        nullCheckExpr.t = TBool;

        var isValid = new HxbTypedExpr(
            TBinop(OpEq, 
                nullCheckExpr, 
                new HxbTypedExpr(TConst(TBool(op == OpEq)), TBool, expr.pos)
            ),
            TBool, 
            expr.pos
        );

        expr.expr = TParenthesis({
            expr: TBinop(
                op == OpEq ? OpBoolAnd : OpBoolOr,
                isValid,
                hx2go.normaliser.ExprCopy.copy(expr)
            ),
            t: expr.t,
            pos: expr.pos,
        });
        context.submitNode(expr, true, 1);
    }

}