package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.Typed.HxbFieldAccess;
import hx2go.util.ExprHelper;

class RewriteArrayGetData extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TCall({ expr: TField(_, FStatic({ name: 'HxArray', pack: ['go', 'haxe'] }, { name: 'getData' })) }, _): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        expr.expr = switch expr.expr {
            case TCall({ expr: TField(_, FStatic({ name: 'HxArray', pack: ['go', 'haxe'] }, { name: 'getData' })) }, [arr]): switch arr.t {
                case TInst({ name: 'Array', pack: [] }, _): ExprHelper.createUntyped('(*{0})', [arr]).expr;
                case TDynamic(_) | TDynamicAny if (isFreshArrayLiteral(arr)):
                    ExprHelper.createUntyped('(*{0})', [arr]).expr;
                case TDynamic(_) | TDynamicAny:
                    ExprHelper.createUntyped('(*(({0}).(*[]any)))', [arr]).expr;
                case _: expr.expr;
            };

            case _: expr.expr;
        }
    }

    static function isFreshArrayLiteral(e: HxbTypedExpr): Bool {
        return switch e.expr {
            case TArrayDecl(_): true;
            case TCast(inner, _) | TParenthesis(inner): isFreshArrayLiteral(inner);
            case _: false;
        }
    }

}