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
import hx2go.normaliser.Semantics;

// NOTE: identical to NullableField, but separate for clarity
class NullableIndex extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TArray(e, idx): Semantics.isNullableExpr(context, e) || Semantics.isNullableExpr(context, idx);
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TArray(e, idx): {
                if (Semantics.isNullableExpr(context, e)) {
                    var local = Copy.copy(e);
                    context.submitNode(local, true);

                    e.expr = ExprHelper.createUntyped('{0}.Value', [local]).expr;
                }

                if (Semantics.isNullableExpr(context, idx)) {
                    var local = Copy.copy(idx);
                    context.submitNode(local, true);

                    idx.expr = ExprHelper.createUntyped('{0}.Value', [local]).expr;
                }
            }
            case _: null;
        }
    }

}