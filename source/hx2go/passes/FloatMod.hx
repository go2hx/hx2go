package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.HxbModuleType;
import hx2go.util.TypeHelper;
import hx2go.util.ExprHelper;
import hx2go.normaliser.Semantics;
import hxb.Ast.HxbBinop;
import hxb.HxbType;
import haxe.runtime.Copy;

class FloatMod extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TBinop(OpAssignOp(OpMod) | OpMod, _, _): Semantics.isFloatType(context, expr.t);
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        var op = null;
        var right = null;
        var left = null;
        var o = switch expr.expr {
            case TBinop(b_op, b_left, b_right):
                op = b_op;
                right = b_right;
                left = b_left;
                context.defineImport(frame, "math");
                ExprHelper.createUntyped('math.Mod({0}, {1})', [b_left, Copy.copy(b_right)]);
            case _: expr;
        }
        if (op.match(OpAssignOp(OpMod))) {
            expr.expr = TBinop(OpAssign, Copy.copy(left), o);
            context.submitNode(expr, true);
        }else{
            expr.expr = o.expr;
            expr.t = o.t;
        }
    }

}