package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.Typed.HxbFieldAccess;
import hx2go.util.ExprHelper;
import haxe.runtime.Copy;

class RewriteSyntaxDefer extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TCall({ expr: TField(_, FStatic({ name: 'Syntax', pack: ['go'] }, { name: 'defer' })) }, _): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
       switch expr.expr {
           case TCall({ expr: TField(_, FStatic({ name: 'Syntax', pack: ['go'] }, { name: 'defer' })) }, params): {
               var o = ExprHelper.createUntyped('defer {0}', [
                   new HxbTypedExpr(TCall(Copy.copy(params[0]), []), params[0].t, expr.pos)
               ]);

               expr.expr = o.expr;
               context.submitNode(expr, true);
           }

           case _: null;
       }
    }

}