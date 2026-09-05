package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.flags.HxbClassFlag;
import hxb.Typed.HxbFieldAccess;
import hxb.Ast.HxbExpr;
import hxb.Ast.HxbExprDef.EObjectDecl;
import hxb.Ast.HxbExprDef.EConst;
import hxb.Ast.HxbExprDef.EArrayDecl;
import hxb.HxbModuleType;
import hx2go.util.ExprHelper;
import hx2go.util.StringConversions;
import hxb.Ast.HxbObjectField;
import hx2go.util.ObjectFieldHelper;
import hxb.HxbType;
import hx2go.util.TypeHelper;
import hxb.Typed.HxbVar;
import hxb.Typed.HxbTypedExprDef;
import hx2go.normaliser.ExprCopy;

class ArrayAccessDynamicSet extends CompilerPass {

    public var tmpId: Int = 0;

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TBinop(OpAssign | OpAssignOp(_), { expr: TArray({ t: t }, _) }, _):
                switch (TypeHelper.follow(context, t)) {
                    case TDynamic(_) | TDynamicAny: true;
                    case _: false;
                }
            case _: false;
        }
    }

    public function setArrayIndex(on: HxbTypedExpr, idx: HxbTypedExpr, value: HxbTypedExpr): HxbTypedExpr {
        return ExprHelper.createCallStatic(context, { name: 'HxDynamic', moduleName: 'HxDynamic', pack: ['go', 'haxe'] }, 'setArrayIndex', ExprCopy.copyList([on, idx, value]));
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        var o = switch expr.expr {
            case TBinop(OpAssign, { expr: TArray(e, eidx) }, right):
                setArrayIndex(e, eidx, right);

            case TBinop(OpAssignOp(op), arr = { expr: TArray(e, eidx) }, right):
                var eTmp = new HxbVar(-1, 'hx_arr_base${tmpId++}', VUser(TVOLocalVariable), 0, [], e.pos, e.t);
                var eTmpLocal = new HxbTypedExpr(TLocal(eTmp), e.t, e.pos);

                var eidxTmp = new HxbVar(-1, 'hx_arr_idx${tmpId++}', VUser(TVOLocalVariable), 0, [], eidx.pos, eidx.t);
                var eidxTmpLocal = new HxbTypedExpr(TLocal(eidxTmp), eidx.t, eidx.pos);

                var arrRead = new HxbTypedExpr(TArray(eTmpLocal, eidxTmpLocal), arr.t, arr.pos);
                var setCall = setArrayIndex(eTmpLocal, eidxTmpLocal, { expr: TBinop(op, arrRead, right), t: arr.t, pos: expr.pos });

                new HxbTypedExpr(TBlock([
                    new HxbTypedExpr(TVar(eTmp, e), eTmpLocal.t, e.pos),
                    new HxbTypedExpr(TVar(eidxTmp, eidx), eidxTmpLocal.t, eidx.pos),
                    setCall
                ]), setCall.t, expr.pos);

            case _: expr;
        }

        expr.expr = o.expr;
        expr.t = o.t;

        context.submitNode(expr, true);
    }

}