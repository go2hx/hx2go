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

class FieldAccessDynamicGet extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TField(_, FDynamic(_) | FClosureAnon(_)): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        var o = switch expr.expr {
            case TField(e, FDynamic(field)): ExprHelper.createCallStatic(context, { name: 'HxDynamic', moduleName: 'HxDynamic', pack: ['go', 'haxe'] }, 'getField', [e, new HxbTypedExpr(TConst(TString(field)), TString, null)]);
            case TField(e, FClosureAnon(cf)): ExprHelper.createCallStatic(context, { name: 'HxDynamic', moduleName: 'HxDynamic', pack: ['go', 'haxe'] }, 'getField', [e, new HxbTypedExpr(TConst(TString(cf.name)), TString, null)]);
            case _: expr;
        }

        expr.expr = o.expr;
        expr.t = o.t;
    }

}