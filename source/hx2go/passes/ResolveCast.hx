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
import hxb.tools.TypeTools;
import hxb.HxbType;

class ResolveCast extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TCast(_): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TCast(_): {
                TypeTools.walk(expr.t, ResolveVarDecl.resolveType.bind(context, _, frame));
            }

            case _: null;
        }
    }

}