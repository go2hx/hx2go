package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.Typed.HxbFieldAccess;
import hx2go.util.ExprHelper;

class RewriteSliceCreation extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TCall({ expr: TField(_, FStatic({ name: 'Slice_Impl_', moduleName: 'Slice', pack: ['go'] }, { name: '_create' })) }, _): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, type: HxbModuleType): Void {
        var o = ExprHelper.createUntyped('${context.getWriter().types.writeHxbType(expr.t)}{}', []);
        expr.expr = o.expr;
        expr.t = o.t;
    }

}