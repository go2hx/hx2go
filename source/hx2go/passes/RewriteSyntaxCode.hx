package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.HxbModuleType;
import hxb.Typed.HxbTypedExprDef;
import hxb.Typed.HxbFieldAccess;
import haxe.runtime.Copy;

class RewriteSyntaxCode extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TCall({ expr: TField(_, FStatic({ name: 'Syntax', pack: ['go'] }, { name: 'code' })) }, _): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
       expr.expr = switch expr.expr {
           case TCall({ expr: TField(_, FStatic({ name: 'Syntax', pack: ['go'] }, { name: 'code' })) }, params): TCall(
               new HxbTypedExpr(TIdent("__go__"), null, null),
               Copy.copy(params)
           );

           case _: return;
       }

        context.submitNode(expr, true);
    }

}