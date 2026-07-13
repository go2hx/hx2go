package hx2go.normaliser;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.tools.TypedExprTools;
import hx2go.hxb.Typed.HxbTypedExprDef;
import haxe.runtime.Copy;
import hx2go.hxb.HxbType;
import hx2go.hxb.Typed.HxbTConstant;
import hx2go.hxb.Ast.HxbUnop;
import hx2go.hxb.Ast.HxbBinop;
import hx2go.util.ExprHelper;

class Normaliser {

    public static function run(expr: HxbTypedExpr, scope: Scope, context: Context): Void {
        new Normaliser(context).processExpr(expr, scope, null);
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

    public function ensureShift(expr: HxbTypedExpr, left: HxbTypedExpr, right: HxbTypedExpr, op: HxbBinop, scope: Scope, ancestor: Null<Ancestor>): Void {
        left.expr = switch left.expr {
            case TLocal(_): left.expr;
            case _: scope.temp(expr, Copy.copy(left), this, scope, ancestor).expr;
        }

        var exprSigned = Semantics.getIntegerSigned(left.t);
        var opSigned = op != OpUShr;

        expr.expr = TBinop(op == OpUShr ? OpShr : op, left, right);

        if (exprSigned != opSigned) {
            var lhsWidth: Int = switch left.t {
                // getIntegerWidth returns 64, because that is usually what go's "int" is (we assume the wider type)
                // but semantically, haxe expects int to behave like a 32-bit one, we must force it to do OpUShr on a 32-bit unsigned value.
                case TAbstract({ name: "Int" | "UInt", pack: [] }, _) | TInt: 32;
                case _: Semantics.getIntegerWidth(left.t);
            }

            var lhsName: String = '${opSigned ? "" : "U"}Int${lhsWidth}';
            var lhsType: HxbType = TAbstract({ pack: ['go'], name: lhsName, moduleName: lhsName }, []);

            left.t = lhsType; // will force cast to lhsType, as "m" of TCast is ignored.
            left.expr = TCast(Copy.copy(left), null);
            expr.expr = TCast(Copy.copy(expr), null); // expr.t is already the desired type.
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
            case TBinop(OpAssign, _, _):
                null;

            case TBinop(OpAssignOp(op), left, right):
                expr.expr = TBinop(
                    OpAssign,
                    Copy.copy(left),
                    new HxbTypedExpr(TBinop(
                        op,
                        left,
                        right
                    ), expr.t, null)
                );

            case TBlock(_): {
                var local = scope.copy();
                local.lastValidBlock = expr;

                return iterateExpr(expr, local, ancestor);
            }

            case TBinop(op, left, right): // TODO: ensure OpShr / OpUShr
                Semantics.ensure(expr, [left, right], this, scope, ancestor);

                if (op.match(OpShr) || op.match(OpShl)) ensureShift(expr, left, right, op, scope, ancestor);
                else if (op.match(OpUShr)) ensureShift(expr, left, right, op, scope, ancestor);

                return;

            case TObjectDecl(fields):
                return Semantics.ensure(expr, fields.map(f -> f.expr), this, scope, ancestor);

            case TArrayDecl(values):
                return Semantics.ensure(expr, values, this, scope, ancestor);

            /* case TCall({ expr: TIdent("__go__") }, _):
                return; // skip */

            case TCall(_, params):
                return Semantics.ensure(expr, params, this, scope, ancestor);

            case TArray(e1, e2):
                return Semantics.ensure(expr, [e1, e2], this, scope, ancestor);

            case TWhile(econd, ebody, normalWhile) if (Semantics.goingToMutate(econd, expr) || Semantics.hasSideEffects(econd) || !normalWhile): {  // while (cond) { body } -> while (true) { if (!cond) break; body; }
                var block = ensureBlock(ebody);
                var exprs = switch block.expr {
                    case TBlock(x): x;
                    case _: [];
                }

                var c = econd;
                if (!econd.t.match(TBool)) {
                    c = ExprHelper.createCallStatic(context, { name: "HxDynamic", moduleName: "HxDynamic", pack: ['go', 'haxe'] }, "toBool", [Copy.copy(econd)]);
                }

                var newCond = new HxbTypedExpr(TIf(
                    ensureParen(new HxbTypedExpr(TUnop(OpNot, false, Copy.copy(c)), null, null)),
                    ensureBlock(new HxbTypedExpr(TBreak, null, null)),
                    null
                ), null, null);

                if (normalWhile) exprs.unshift(newCond);
                else exprs.push(newCond);

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
                expr.expr = TUnop(op, true, e); // at this point it is guarenteed to be used as a stmt, so we can just use x++

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
                    removeCast(Copy.copy(e)),
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

    public function removeCast(expr: HxbTypedExpr):HxbTypedExpr {
        return switch expr.expr {
            case TCast(e, m):
                removeCast(e);
            default:
                expr;
        }
    }

    public function toStmt(expr: HxbTypedExpr, scope: Scope, ancestor: Null<Ancestor>): Void {
        expr.expr = TBinop(
            OpAssign,
            new HxbTypedExpr(TIdent('_'), TVoid, null),
            Copy.copy(expr)
        ); // TODO: if no side effects, it may be omitted.
    }

}
