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

class RewriteAnonAccess extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TField(_, FAnon(_)): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, type: HxbModuleType): Void {
        expr.expr = switch expr.expr {
            case TField(e, FAnon(cf)): {
                var localCf = cf.shallowCopy();
                localCf.name = StringConversions.nameToFieldName(cf.name);

                TField(e, FAnon(localCf));
            }
            case _: expr.expr;
        }
    }

}