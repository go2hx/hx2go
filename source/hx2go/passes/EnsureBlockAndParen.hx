package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.Typed.HxbTypedExprDef;

class EnsureBlockAndParen implements ICompilerPass {

    private var context: Context;

    public function new(context: Context) {
        this.context = context;
    }

    private function ensureBlock(expr: HxbTypedExpr): HxbTypedExpr {
        if (expr == null) {
            return expr;
        }

        return switch expr.expr {
            case TBlock(_): expr;
            case _: {
                var e = new HxbTypedExpr(TBlock([ expr ]), expr.t, expr.pos);
                context.submitNode(e);

                return e;
            }
        }
    }

    private function ensureParen(expr: HxbTypedExpr): HxbTypedExpr {
        if (expr == null) {
            return expr;
        }

        return switch expr.expr {
            case TParenthesis(_): expr;
            case _: {
                var e = new HxbTypedExpr(TParenthesis(expr), expr.t, expr.pos);
                context.submitNode(e);

                return e;
            }
        }
    }

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TWhile(_, _, _) |
                 TIf(_, _, _): true;

            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, type: HxbModuleType): Void {
        expr.expr = switch expr.expr {
            case TWhile(econd, ebody, normalWhile): TWhile(ensureParen(econd), ensureBlock(ebody), normalWhile);
            case TIf(econd, eif, eelse): TIf(ensureParen(econd), ensureBlock(eif), ensureBlock(eelse));

            case _: expr.expr;
        }

    }

}