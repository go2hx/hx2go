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
import hx2go.util.TypeHelper;

class RewriteStringLength extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TField(_, FInstance({ name: 'String', pack: [] }, _, { name: 'length' })): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        context.defineImport(frame, "unicode/utf8");

        var o = switch expr.expr {
            case TField(e, FInstance({ name: 'String', pack: [] }, _, { name: 'length' })): ExprHelper.createUntyped('int32(utf8.RuneCountInString({0}))', [e]);
            case _: expr;
        }

        if (!TypeHelper.compare(expr.t, TInt)) {
            o = ExprHelper.createCast(o, expr.t);
        } else {
            o.t = TInt;
        }

        expr.expr = o.expr;
        expr.t = o.t;

        context.submitNode(expr, true);
    }

}