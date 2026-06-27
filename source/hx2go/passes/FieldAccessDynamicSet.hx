package hx2go.passes;

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
import hx2go.hxb.Typed.HxbVar;
import hx2go.hxb.Typed.HxbVarKind;
import haxe.runtime.Copy;

class FieldAccessDynamicSet extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TBinop(OpAssign | OpAssignOp(_), { expr: TField(_, FDynamic(_)) }, _): true;
            case _: false;
        }
    }

    public function setField(on: HxbTypedExpr, field: String, value: HxbTypedExpr): HxbTypedExpr {
        return ExprHelper.createCallStatic(context, { name: 'HxDynamic', moduleName: 'HxDynamic', pack: ['go', 'hx2go'] }, 'setField', [on, new HxbTypedExpr(TConst(TString(field)), TString, null), value]);
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        var o = switch expr.expr {
            case TBinop(OpAssign, { expr: TField(e, FDynamic(field)) }, right):
                setField(e, field, right);

            case _: expr;
        }

        expr.expr = o.expr;
        expr.t = o.t;
    }

}