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
import haxe.runtime.Copy;
import hx2go.util.TypeHelper;

class TypeNormaliserUnop extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TUnop(_, _, e): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TUnop(_, _, e): {
                if (!TypeHelper.compare(e.t, expr.t)) {
                    var o = ExprHelper.createCast(e, expr.t);
                    e.expr = o.expr;
                    e.t = o.t;

                    context.submitNode(e, true);
                }

            }
            case _: null;
        }
    }

}