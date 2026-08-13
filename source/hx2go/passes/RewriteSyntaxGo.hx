package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.HxbModuleType;
import hxb.Typed.HxbTypedExprDef;
import hxb.Typed.HxbFieldAccess;
import hx2go.util.ExprHelper;

class RewriteSyntaxGo extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TCall({ expr: TField(_, FStatic({ name: 'Syntax', pack: ['go'] }, { name: 'go' })) }, _): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TCall({ expr: TField(_, FStatic({ name: 'Syntax', pack: ['go'] }, { name: 'go' })) }, params): {
                var o = ExprHelper.createUntyped('go {0}', [
                    new HxbTypedExpr(TCall(hx2go.normaliser.ExprCopy.copy(params[0]), []), params[0].t, expr.pos)
                ]);

                expr.expr = o.expr;
                context.submitNode(expr, true);
            }

            case _: null;
        }
    }

}