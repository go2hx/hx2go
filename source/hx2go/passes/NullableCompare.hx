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
                    case TAbstract({ pack: [], name: 'Null' }, _): ExprHelper.createUntyped("{0}.Valid", [local_cmp]).expr;
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
                switch left.t {
                    case TAbstract({ pack: [], name: 'Null' }, p):
                        left.expr = ExprHelper.createUntyped("{0}.Value", [local_cmp]).expr;
                        left.t = p[0];

                    case _:
                        left.expr = local_cmp.expr;
                }

                context.submitNode(left, true);

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