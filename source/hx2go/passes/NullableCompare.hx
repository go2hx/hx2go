package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.util.TypeHelper;
import hx2go.util.ExprHelper;
import hx2go.normaliser.Semantics;
import hx2go.hxb.Ast.HxbBinop;
import hx2go.hxb.HxbType;
import haxe.runtime.Copy;

class NullableCompare extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TBinop(OpEq | OpNotEq, { t: TAbstract({ pack: [], name: 'Null' }, _) }, _) |
                 TBinop(OpEq | OpNotEq, _, { t: TAbstract({ pack: [], name: 'Null' }, _) }): true;

            case _: false;
        }
    }

    public function executeSide(right: HxbTypedExpr, left: HxbTypedExpr): Void {
        switch right.expr {
            case TConst(TNull):
                var local_cmp = Copy.copy(left);
                left.expr = switch left.t {
                    case TAbstract({ pack: [], name: 'Null' }, _):  ExprHelper.createUntyped("{0}.Valid", [local_cmp]).expr;
                    case _:  ExprHelper.createUntyped("{0} != nil", [local_cmp]).expr;
                }

                left.t = TBool;
                right.expr = TConst(TBool(false));
                right.t = TBool;
                context.submitNode(local_cmp, true);

            case TConst(_):
                var local_cmp = Copy.copy(left);
                left.expr = switch left.t {
                    case TAbstract({ pack: [], name: 'Null' }, _):  ExprHelper.createUntyped("{0}.Value", [local_cmp]).expr;
                    case _:  local_cmp.expr;
                }
                context.submitNode(local_cmp, true);

            case _: null;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        var left: HxbTypedExpr = null;
        var right: HxbTypedExpr = null;

        switch expr.expr {
            case TBinop(_, b_left, b_right):
                left = b_left;
                right = b_right;

            case _: return;
        }

        executeSide(left, right);
        executeSide(right, left);
    }

}