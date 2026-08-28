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

class ArrayAccessDynamicSet extends CompilerPass {

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
        return ExprHelper.createCallStatic(context, { name: 'HxDynamic', moduleName: 'HxDynamic', pack: ['go', 'haxe'] }, 'setArrayIndex', [on, idx, value]);
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        var o = switch expr.expr {
            case TBinop(OpAssign, { expr: TArray(e, eidx) }, right):
                setArrayIndex(e, eidx, right);

            case TBinop(OpAssignOp(op), arr = { expr: TArray(e, eidx) }, right):
                setArrayIndex(e, eidx, { expr: TBinop(op, arr, right), t: arr.t, pos: expr.pos });

            case _: expr;
        }

        expr.expr = o.expr;
        expr.t = o.t;
    }

}