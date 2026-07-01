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

class RewriteArrayLength extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TField(_, FInstance({ name: 'Array', pack: [] }, _, { name: 'length' })): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        var o = switch expr.expr {
            case TField(e, FInstance({ name: 'Array', pack: [] }, [TDynamic(_) | TDynamicAny], { name: 'length' })): ExprHelper.createCallStatic(context, { name: 'HxDynamic', moduleName: 'HxDynamic', pack: ['go', 'hx2go'] }, 'getArrayLength', [e]);
            case TField(e, FInstance({ name: 'Array', pack: [] }, _, { name: 'length' })): ExprHelper.createUntyped('len(*{0})', [e]);
            case _: expr;
        }

        expr.expr = o.expr;
        expr.t = o.t;
        context.submitNode(expr, true);
    }

}