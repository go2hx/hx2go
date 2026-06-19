package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.Typed.HxbFieldAccess;
import hx2go.util.ExprHelper;

class RewriteSyntaxGo extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TCall({ expr: TField(_, FStatic({ name: 'Syntax', pack: ['go'] }, { name: 'go' })) }, _): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, type: HxbModuleType): Void {
        expr.expr = switch expr.expr {
            case TCall({ expr: TField(_, FStatic({ name: 'Syntax', pack: ['go'] }, { name: 'go' })) }, params): {
                switch params[0].expr {
                    case TFunction({ expr: e}): ExprHelper.createUntyped(context, 'go func() {0}()', [ e ]).expr;
                    case TField(_) | TLocal(_): ExprHelper.createUntyped(context, 'go {0}()', [ params[0] ]).expr;
                    case _: return;
                }
            }

            case _: expr.expr;
        }
    }

}