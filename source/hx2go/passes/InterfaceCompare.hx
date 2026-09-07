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
            case [TBinop(op = (OpEq | OpNotEq), left, right), TBinop(_, { t: TInst(ltp, _) }, { t: TInst(rtp, _) })]: {
                switch context.resolve(ltp) {
                    case MClass(x) if (x.flags & HxbClassFlag.CInterface != 0): null;
                    case _: return;
                }

                switch context.resolve(rtp) {
                    case MClass(x) if (x.flags & HxbClassFlag.CInterface != 0): null;
                    case _: return;
                }

                var isNotEq = op.match(OpNotEq);
                var opStr = isNotEq ? "!=" : "==";

                if (TypeHelper.isNullConst(left)) {
                    expr.expr = ExprHelper.createUntyped('{0} $opStr nil', [right]).expr;
                } else if (TypeHelper.isNullConst(right)) {
                    expr.expr = ExprHelper.createUntyped('{0} $opStr nil', [left]).expr;
                } else {
                    var body = 'a == nil && b == nil || a != nil && b != nil && a.VTable == b.VTable';
                    if (isNotEq) body = '!($body)';
                    expr.expr = ExprHelper.createUntyped(
                        'func() bool { a, b := {0}, {1}; return $body }()',
                        [left, right]
                    ).expr;
                }
            }

            case _: null;
        }
    }

}