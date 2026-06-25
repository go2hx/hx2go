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

class RewriteStringLength extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TField(_, FInstance({ name: 'String', pack: [] }, _, { name: 'length' })): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        context.defineImport(frame.type, "unicode/utf8");

        var o = switch expr.expr {
            case TField(e, FInstance({ name: 'String', pack: [] }, _, { name: 'length' })): ExprHelper.createUntyped('utf8.RuneCountInString({0})', [e]);
            case _: expr;
        }

        expr.expr = o.expr;
        expr.t = o.t;
        context.submitNode(expr, true);
    }

}