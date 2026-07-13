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

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        var o = switch expr.expr {
            case TCall({ expr: TField(_, FStatic({ name: 'Slice_Impl_', moduleName: 'Slice', pack: ['go'] }, { name: '_create' })) }, el): 
                ExprHelper.createUntyped('make(${context.getWriter().types.writeHxbType(expr.t)}, {0})', el);
            case _:
                expr;
        }
        expr.expr = o.expr;
        expr.t = o.t;
    }

}