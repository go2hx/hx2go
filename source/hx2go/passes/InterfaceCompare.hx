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

class InterfaceCompare extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TBinop(OpEq | OpNotEq, left, right) if (
                left.t != null && left.t.match(TInst(_)) &&
                right.t != null && right.t.match(TInst(_))
            ): true;

            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch [expr.expr, expr.expr] {
            case [TBinop(OpEq | OpNotEq, left, right), TBinop(OpEq | OpNotEq, { t: TInst(ltp, _) }, { t: TInst(rtp, _) })]: {
                switch context.resolve(ltp) {
                    case MClass(x) if (x.flags & HxbClassFlag.CInterface != 0): null;
                    case _: return;
                }

                switch context.resolve(rtp) {
                    case MClass(x) if (x.flags & HxbClassFlag.CInterface != 0): null;
                    case _: return;
                }

                expr.expr = ExprHelper.createUntyped("{0}.VTable == {1}.VTable", [left, right]).expr;
            }

            case _: null;
        }
    }

}