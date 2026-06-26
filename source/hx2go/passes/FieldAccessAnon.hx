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

class FieldAccessAnon extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TField(_, FAnon(_)): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TField(e, FAnon(cf)) if (!expr.t.match(TDynamic(_) | TDynamicAny)):
                var t = expr.t;
                expr.t = TDynamicAny;

                var o = ExprHelper.createCast(expr, t);
                expr.expr = o.expr;
                expr.t = o.t;

                context.submitNode(expr, true, 1);

            case _: null;
        }
    }

}