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
import hxb.Typed.HxbVar;
import hxb.Typed.HxbVarKind;
import haxe.runtime.Copy;

class FieldAccessDynamicSet extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TBinop(OpAssign | OpAssignOp(_), { expr: TField(_, FDynamic(_)) }, _): true;
            case _: false;
        }
    }

    public function setField(on: HxbTypedExpr, field: String, value: HxbTypedExpr): HxbTypedExpr {
        return ExprHelper.createCallStatic(context, { name: 'HxDynamic', moduleName: 'HxDynamic', pack: ['go', 'haxe'] }, 'setField', [on, new HxbTypedExpr(TConst(TString(field)), TString, null), value]);
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