package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.HxbModuleType;
import hxb.Typed.HxbTypedExprDef;
import hxb.Typed.HxbFieldAccess;
import hx2go.util.ExprHelper;

class RewriteMapCreation extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TCall({ expr: TField(_, FStatic({ name: 'Map_Impl_', moduleName: 'Map', pack: ['go'] }, { name: '_create' })) }, _): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        var o = ExprHelper.createUntyped('${context.getWriter().types.writeHxbType(expr.t)}{}', []);
        expr.expr = o.expr;
        expr.t = o.t;
    }

}