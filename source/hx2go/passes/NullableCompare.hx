package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.util.TypeHelper;
import hx2go.util.ExprHelper;
import hx2go.preprocessor.Semantics;
import hx2go.hxb.Ast.HxbBinop;
import hx2go.hxb.HxbType;
import haxe.runtime.Copy;

class NullableCompare extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TBinop(OpEq, { t: TAbstract({ pack: [], name: 'Null' }, _) }, _) |
                 TBinop(OpEq, _, { t: TAbstract({ pack: [], name: 'Null' }, _) }): true;

            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, type: HxbModuleType): Void {
        var left: HxbTypedExpr = null;
        var right: HxbTypedExpr = null;

        switch expr.expr {
            case TBinop(_, b_left, b_right):
                left = b_left;
                right = b_right;

            case _: return;
        }

        if (left.expr.match(TConst(_))) {
            var local_cmp = Copy.copy(right);
            right.expr = ExprHelper.createUntyped("{0}.Valid", [local_cmp]).expr;
            left.expr = TConst(TBool(false));
            context.submitNode(local_cmp, true);
        }

        if (right.expr.match(TConst(_))) {
            var local_cmp = Copy.copy(left);
            left.expr = ExprHelper.createUntyped("{0}.Valid", [local_cmp]).expr;
            right.expr = TConst(TBool(false));
            context.submitNode(local_cmp, true);
        }
    }

}