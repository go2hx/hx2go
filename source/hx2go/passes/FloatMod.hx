package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.util.TypeHelper;
import hx2go.util.ExprHelper;
import hx2go.normaliser.Semantics;
import hx2go.hxb.Ast.HxbBinop;
import hx2go.hxb.HxbType;
import haxe.runtime.Copy;

class FloatMod extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TBinop(OpMod, _, _) if (Semantics.isFloatType(expr.t)): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        var o = switch expr.expr {
            case TBinop(_, b_left, b_right):
                context.defineImport(frame, "math");
                ExprHelper.createUntyped('math.Mod({0}, {1})', [b_left, b_right]);
            case _: expr;
        }
        expr.expr = o.expr;
        expr.t = o.t;
    }

}