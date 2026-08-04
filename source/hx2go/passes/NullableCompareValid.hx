package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.util.TypeHelper;
import hx2go.util.ExprHelper;
import hx2go.normaliser.Semantics;
import hx2go.hxb.Ast.HxbBinop;
import hx2go.hxb.HxbType;
import haxe.runtime.Copy;

class NullableCompareValid extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TBinop(OpEq | OpNotEq, left, right):
                var i = 0;
                i += Semantics.isNullableExpr(context, left) ? 1 : 0;
                i += Semantics.isNullableExpr(context, right) ? 1 : 0;
                i == 1;
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
        var nullCheckExpr = ExprHelper.createUntyped("{0}.Valid", [Copy.copy(nullValue)]);
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
                Copy.copy(expr)
            ),
            t: expr.t,
            pos: expr.pos,
        });
        context.submitNode(expr, true, 1);
    }

}