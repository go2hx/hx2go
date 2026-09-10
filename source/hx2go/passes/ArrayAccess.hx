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
import hx2go.util.TypeHelper;
import hxb.Typed.HxbVar;
import hxb.Typed.HxbTypedExprDef;
import hx2go.normaliser.ExprCopy;

class ArrayAccess extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TArray(_): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TArray(_, eidx) if (eidx?.t != null && !TypeHelper.compare(eidx.t, TInt)): {
                var o = ExprHelper.createCast(eidx, TInt);
                eidx.expr = o.expr;
                eidx.t = o.t;
                context.submitNode(eidx, true);
            };

            case _: null;
        }
    }

}