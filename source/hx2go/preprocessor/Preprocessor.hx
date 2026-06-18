package hx2go.preprocessor;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.tools.TypedExprTools;
import hx2go.hxb.Typed.HxbTypedExprDef;
import haxe.runtime.Copy;
import hx2go.hxb.HxbType;
import hx2go.hxb.Typed.HxbTConstant;
import hx2go.hxb.Ast.HxbUnop;
import hx2go.hxb.Ast.HxbBinop;

class Preprocessor {

    public static function run(expr: HxbTypedExpr, scope: Scope, context: Context): Void {
        new Preprocessor(context).processExpr(expr, scope, null);
    }

    private var context: Context;

    public function new(context: Context) {
        this.context = context;
    }

    public function iterateExpr(e: HxbTypedExpr, scope: Scope, ancestor: Null<Ancestor>) {
        var children = []; // flatten / copy to prevent issues if mutating
        TypedExprTools.iter(e, child -> children.push(child));

        for (idx in 0...children.length) {
            processExpr(children[idx], scope, { node: e, up: ancestor, scope: scope });
        }
    }

    public function ensureBlock(expr: HxbTypedExpr): HxbTypedExpr {
        return switch expr.expr {
            case TBlock(_): expr;
            case _: new HxbTypedExpr(TBlock([ Copy.copy(expr) ]), null, null);
        }
    }

    public function ensureParen(expr: HxbTypedExpr): HxbTypedExpr {
        return switch expr.expr {
            case TParenthesis(_): expr;
            case _: new HxbTypedExpr(TParenthesis(Copy.copy(expr)), null, null);
        }
    }

    public function processExpr(expr: HxbTypedExpr, scope: Scope, ancestor: Null<Ancestor>): Void {
        if (ancestor != null && !Semantics.canHold(ancestor.node, expr)) {
            switch Semantics.getExprKind(expr) {
                case KExpr: toStmt(expr, scope, ancestor); // expr -> stmt (by `_ = expr`)
                case KStmt: toExpr(expr, scope, ancestor); // stmt -> expr (by kind-specific extraction)
                case KEither: expr;
            };
        }

        switch expr.expr {
            case TBinop(OpAssign | OpAssignOp(_), _, _): null;

            case TBlock(_): {
                var local = scope.copy();
                local.lastValidBlock = expr;

                return iterateExpr(expr, local, ancestor);
            }

            case TBinop(op, left, right): // TODO: ensure OpShr / OpUShr
                return Semantics.ensure(expr, [left, right], this, scope, ancestor);

            case TObjectDecl(fields):
                return Semantics.ensure(expr, fields.map(f -> f.expr), this, scope, ancestor);

            case TArrayDecl(values):
                return Semantics.ensure(expr, values, this, scope, ancestor);

            case TCall(_, params):
                return Semantics.ensure(expr, params, this, scope, ancestor);

            case TArray(e1, e2):
                return Semantics.ensure(expr, [e1, e2], this, scope, ancestor);

            case TWhile(econd, ebody, normalWhile) if (Semantics.goingToMutate(econd, expr) || Semantics.hasSideEffects(econd)): {  // while (cond) { body } -> while (true) { if (!cond) break; body; }
                var block = ensureBlock(ebody);
                var exprs = switch block.expr {
                    case TBlock(x): x;
                    case _: [];
                }

                exprs.unshift(new HxbTypedExpr(TIf(
                    ensureParen(new HxbTypedExpr(TUnop(OpNot, false, Copy.copy(econd)), null, null)),
                    ensureBlock(new HxbTypedExpr(TBreak, null, null)),
                    null
                    ), null, null
                ));

                ebody.expr = TBlock(exprs);
                econd.expr = ensureParen(new HxbTypedExpr(TConst(TBool(true)), null, null)).expr;
            }

            case TWhile(econd, ebody, normalWhile):
                econd.expr = ensureParen(econd).expr;
                ebody.expr = ensureBlock(ebody).expr;

            case TIf(econd, eif, eelse):
                econd.expr = ensureParen(econd).expr;
                eif.expr = ensureBlock(eif).expr;

                if (eelse != null) {
                    eelse.expr = ensureBlock(eelse).expr;
                }

            case TUnop(op, false, e) if (op.match(OpIncrement | OpDecrement)):
                expr.expr = TUnop(op, true, e);

            case TLocal(v):
                expr.expr = scope.getLocal(v);

            case TVar(v, e):
                expr.expr = scope.defineLocal(v, e);

            case _: null;
        }

        iterateExpr(expr, scope, ancestor);
    }

    public function toExpr(expr: HxbTypedExpr, scope: Scope, ancestor: Null<Ancestor>): Void {
        var result = switch expr.expr {
            case TBlock(exprs):
                scope.hoist(exprs, this, scope, ancestor);

            case TBinop(OpAssign | OpAssignOp(_), left, right):
                scope.insert(expr, Copy.copy(expr), this, scope, ancestor);
                scope.temp(expr, left, this, scope, ancestor);

            case TUnop(op, postFix, e) if (op.match(OpIncrement | OpDecrement)): {
                var inc = new HxbTypedExpr(TBinop(
                    OpAssignOp(op.match(OpIncrement) ? OpAdd : OpSub),
                    Copy.copy(e),
                    new HxbTypedExpr(TConst(TInt(1)), e.t, e.pos)
                ), null, null);

                var v: HxbTypedExpr;

                if (postFix) {
                    v = scope.temp(expr, e, this, scope, ancestor);
                    scope.insert(expr, inc, this, scope, ancestor);
                } else {
                    scope.insert(expr, inc, this, scope, ancestor);
                    v = scope.temp(expr, e, this, scope, ancestor);
                }

                v;
            }

            case TIf(econd, eif, eelse): {
                econd.expr = ensureParen(econd).expr;

                var result = scope.temp(expr, null, this, scope, ancestor, expr.t);
                var makeAssign = (e: HxbTypedExpr) -> {
                    e.expr = TBinop(OpAssign, result, ensureBlock(Copy.copy(e)));
                };

                makeAssign(eif);
                if (eelse != null) makeAssign(eelse);

                scope.insert(expr, Copy.copy(expr), this, scope, ancestor);

                result;
            }

            case _: expr;
        }

        expr.expr = result.expr;
        expr.t = result.t;
    }

    public function toStmt(expr: HxbTypedExpr, scope: Scope, ancestor: Null<Ancestor>): Void {
        expr.expr = TBinop(
            OpAssign,
            new HxbTypedExpr(TIdent('_'), TVoid, null),
            Copy.copy(expr)
        ); // TODO: if no side effects, it may be omitted.
    }

}
