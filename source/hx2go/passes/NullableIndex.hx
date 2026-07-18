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
import hx2go.hxb.HxbType;
import haxe.runtime.Copy;

// NOTE: identical to NullableField, but separate for clarity
class NullableIndex extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TArray(e, idx): e.t.match(TAbstract({ name: 'Null', pack: [] }, _)) || idx.t.match(TAbstract({ name: 'Null', pack: [] }, _));
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TArray(e, idx): {
                if (e.t.match(TAbstract({ name: 'Null', pack: [] }, _))) {
                    var local = Copy.copy(e);
                    context.submitNode(local, true);

                    e.expr = ExprHelper.createUntyped('{0}.Value', [local]).expr;
                }

                if (idx.t.match(TAbstract({ name: 'Null', pack: [] }, _))) {
                    var local = Copy.copy(idx);
                    context.submitNode(local, true);

                    idx.expr = ExprHelper.createUntyped('{0}.Value', [local]).expr;
                }
            }
            case _: null;
        }
    }

}