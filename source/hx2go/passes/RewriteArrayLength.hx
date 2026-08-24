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

class RewriteArrayLength extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TField(_, FInstance({ name: 'Array', pack: [] }, _, { name: 'length' })): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        var o = switch expr.expr {
            case TField(e, FInstance({ name: 'Array', pack: [] }, _, { name: 'length' })): ExprHelper.createUntyped('{0}.Len()', [e]);
            case _: expr;
        }

        expr.expr = o.expr;
        expr.t = TInt;
        context.submitNode(expr, true);
    }

}