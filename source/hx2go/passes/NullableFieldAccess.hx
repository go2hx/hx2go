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
import hx2go.normaliser.Semantics;

// NOTE: identical to NullableIndex, but separate for clarity
class NullableFieldAccess extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TField(e, _) if (Semantics.isNullableExpr(context, e)): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TField(e, _): {
                var local = hx2go.normaliser.ExprCopy.copy(e);
                var o = ExprHelper.createUntyped('{0}.Value', [local]);

                e.expr = o.expr;
                e.t = TypeHelper.follow(context, e.t);
                context.submitNode(expr, true);
            }
            case _: null;
        }
    }

}