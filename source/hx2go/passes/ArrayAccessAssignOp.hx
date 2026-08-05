package hx2go.passes;

import hxb.HxbType;
import hxb.Typed.HxbVar;
import hxb.Typed.HxbTypedExpr;

class ArrayAccessAssignOp extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TBinop(OpAssignOp(_), { expr: TArray(_, _) }, _): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TBinop(OpAssignOp(op), left = { expr: TArray(e, eidx) }, right):
                var tmp_e = new HxbVar(-1, 'hx_op_e', VUser(TVOLocalVariable), 0, [], e.pos, e.t);
                var tmp_idx = new HxbVar(-1, 'hx_op_idx', VUser(TVOLocalVariable), 0, [], eidx.pos, eidx.t);

                var dyn = e.t.match(TDynamic(_) | TDynamicAny);
                var elem = dyn ? TDynamicAny : expr.t;

                var local = (v: HxbVar, of: HxbTypedExpr) -> new HxbTypedExpr(TLocal(v), of.t, of.pos);
                var access = () -> new HxbTypedExpr(
                    TArray(local(tmp_e, e), local(tmp_idx, eidx)),
                    dyn ? TDynamicAny : left.t,
                    left.pos
                );

                var o = new HxbTypedExpr(TBlock([
                    new HxbTypedExpr(TVar(tmp_e, e), e.t, e.pos),
                    new HxbTypedExpr(TVar(tmp_idx, eidx), eidx.t, eidx.pos),
                    new HxbTypedExpr(TBinop(
                        OpAssign,
                        access(),
                        new HxbTypedExpr(TBinop(op, access(), right), elem, expr.pos)
                    ), elem, expr.pos),
                ]), elem, expr.pos);

                expr.expr = o.expr;
                expr.t = o.t;
                context.submitNode(expr, true);

            case _:
        }
    }

}
