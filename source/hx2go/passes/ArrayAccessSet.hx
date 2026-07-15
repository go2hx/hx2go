package hx2go.passes;

import hx2go.hxb.Typed.HxbVar;
import haxe.runtime.Copy;
import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.flags.HxbClassFlag;
import hx2go.hxb.Typed.HxbFieldAccess;
import hx2go.hxb.Ast.HxbExpr;
import hx2go.hxb.Ast.HxbExprDef.EObjectDecl;
import hx2go.hxb.Ast.HxbExprDef.EConst;
import hx2go.hxb.Ast.HxbExprDef.EArrayDecl;
import hx2go.hxb.HxbModuleType;
import hx2go.util.ExprHelper;
import hx2go.util.StringConversions;
import hx2go.hxb.Ast.HxbObjectField;
import hx2go.util.ObjectFieldHelper;
import hx2go.hxb.HxbType;
import hx2go.util.TypeHelper;

class ArrayAccessSet extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TBinop(OpAssign | OpAssignOp(_), { expr: TArray(_, _), t: t }, _):
                true;
            case _: false;
        }
    }

    public function growCheck(frame:ContextFrame, expr: HxbTypedExpr, on: HxbTypedExpr, idx: HxbTypedExpr, value: HxbTypedExpr): HxbTypedExpr {
        var elem = context.getWriter().types.writeHxbType(expr.t); // element type, e.g. "int"
        var len = ExprHelper.createUntyped('len(*{0})', [on]);
        return new HxbTypedExpr(
            TIf(
                {expr: TBinop(OpGte, idx, len), t: expr.t, pos: expr.pos},
                ExprHelper.createUntyped('*{0} = append(*{0}, make([]${elem}, {1}+1-len(*{0}))...)', [on, idx]),
                null,
            ),
            expr.t, expr.pos,
        );
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TBinop(OpAssign, { expr: TArray(e, eidx) }, right):
                var tmp_e = new HxbVar(
                    -1,
                    'hx_e',
                    VUser(TVOLocalVariable),
                    0,
                    [],
                    e.pos,
                    e.t
                );
                var tmp_e_local = new HxbTypedExpr(
                    TLocal(tmp_e),
                    eidx.t,
                    eidx.pos
                );
                var tmp_idx = new HxbVar(
                    -1,
                    'hx_idx',
                    VUser(TVOLocalVariable),
                    0,
                    [],
                    eidx.pos,
                    eidx.t
                );
                var tmp_idx_local = new HxbTypedExpr(
                    TLocal(tmp_idx),
                    eidx.t,
                    eidx.pos
                );
                var rightCopy = Copy.copy(right);
                var o = new HxbTypedExpr(TBlock([
                    new HxbTypedExpr(TVar(tmp_e, Copy.copy(e)), e.t, e.pos),
                    new HxbTypedExpr(TVar(tmp_idx, Copy.copy(eidx)), eidx.t, eidx.pos),
                    growCheck(frame, Copy.copy(expr), tmp_e_local, tmp_idx_local, rightCopy),
                    new HxbTypedExpr(
                        TBinop(OpAssign, { 
                            expr: ExprHelper.createUntyped("(*{0})[{1}]", [tmp_e_local, tmp_idx_local]).expr, 
                            t: expr.t, 
                            pos: expr.pos 
                    }, rightCopy), expr.t, expr.pos),
                ]), 
                expr.t, expr.pos
                );
                expr.expr = o.expr;
                expr.t = o.t;
                context.submitNode(expr, true);
            case _:
        }
    }

}