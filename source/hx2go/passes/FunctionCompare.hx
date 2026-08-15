package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.HxbModuleType;
import hx2go.util.TypeHelper;
import hx2go.util.ExprHelper;
import hx2go.normaliser.Semantics;
import hxb.Ast.HxbBinop;
import hxb.HxbType;
import haxe.runtime.Copy;
import hxb.flags.HxbClassFlag;

class FunctionCompare extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TBinop(OpEq | OpNotEq, left, right) if (
                left.t != null && TypeHelper.follow(context, left.t).match(TFun(_)) &&
                right.t != null && TypeHelper.follow(context, right.t).match(TFun(_))
            ): true;

            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch [expr.expr, expr.expr] {
            case [TBinop(OpEq | OpNotEq, left, right), TBinop(OpEq | OpNotEq, _, _)]: {
                var o = ExprHelper.createCast(left, TDynamicAny);
                    left.expr = o.expr;
                    left.t = o.t;

                var o = ExprHelper.createCast(right, TDynamicAny);
                    right.expr = o.expr;
                    right.t = o.t;

                expr.t = TDynamicAny;
                context.submitNode(expr, true);
            }

            case _: null;
        }
    }

}