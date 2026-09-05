package hx2go.normaliser;

import hxb.Typed.HxbTypedExpr;
import hxb.tools.TypedExprTools;
import hxb.Typed.HxbTypedExprDef;
import hxb.HxbType;
import hxb.Typed.HxbTConstant;
import hxb.Ast.HxbUnop;
import hxb.Ast.HxbBinop;
import hx2go.util.ExprHelper;

class Normaliser {

    public static function run(expr: HxbTypedExpr, scope: Scope, context: Context): Void {
        Semantics.clearMutateCache();
        new Normaliser(context).processExpr(expr, scope, null);
    }

    private var context: Context;
    private var labelId: Int = 0;
    private var loopLabels: haxe.ds.ObjectMap<HxbTypedExpr, String> = new haxe.ds.ObjectMap();

    public function new(context: Context) {
        this.context = context;
    }

    public function iterateExpr(e: HxbTypedExpr, scope: Scope, ancestor: Null<Ancestor>) {
        var children = []; // flatten / copy to prevent issues if mutating
        TypedExprTools.iter(e, child -> {
            if (child != null) children.push(child);
        });

        for (idx in 0...children.length) {
            processExpr(children[idx], scope, { node: e, up: ancestor, scope: scope });
        }
    }

    public function ensureBlock(expr: HxbTypedExpr): HxbTypedExpr {
        return switch expr.expr {
            case TBlock(_): expr;
            case _: new HxbTypedExpr(TBlock([ ExprCopy.copy(expr) ]), null, null);
        }
    }

    public function ensureParen(expr: HxbTypedExpr): HxbTypedExpr {
        return switch expr.expr {
            case TParenthesis(_): expr;
            case _: new HxbTypedExpr(TParenthesis(ExprCopy.copy(expr)), null, null);
        }
    }

    public function ensureShift(expr: HxbTypedExpr, left: HxbTypedExpr, right: HxbTypedExpr, op: HxbBinop, scope: Scope, ancestor: Null<Ancestor>): Void {
        left.expr = switch left.expr {
            case TLocal(_): left.expr;
            case _: scope.temp(expr, ExprCopy.copy(left), this, scope, ancestor).expr;
        }

        var exprSigned = Semantics.getIntegerSigned(left.t);
        var opSigned = op != OpUShr;

        expr.expr = TBinop(op == OpUShr ? OpShr : op, left, right);

        if (exprSigned != opSigned) {
            var lhsWidth: Int = switch left.t {
                // getIntegerWidth returns 64, because that is usually what go's "int" is (we assume the wider type)
                // but semantically, haxe expects int to behave like a 32-bit one, we must force it to do OpUShr on a 32-bit unsigned value.
                case TAbstract({ name: "Int" | "UInt", pack: [] }, _) | TInt: 32; // TODO: review if we still need this after changing mapping int to int32
                case _: Semantics.getIntegerWidth(left.t);
            }

            var lhsName: String = '${opSigned ? "" : "U"}Int${lhsWidth}';
            var lhsType: HxbType = TAbstract({ pack: ['go'], name: lhsName, moduleName: lhsName }, []);

            left.t = lhsType; // will force cast to lhsType, as "m" of TCast is ignored.
            left.expr = TCast(ExprCopy.copy(left), null);
            expr.expr = TCast(ExprCopy.copy(expr), null); // expr.t is already the desired type.
        }
    }

    public function ensureNonConstArith(expr: HxbTypedExpr, left: HxbTypedExpr, right: HxbTypedExpr, scope: Scope, ancestor: Null<Ancestor>): Void {
        if (!needsOverflowGuard(left.t) && !needsOverflowGuard(right.t)) return;
        if (!isLiteralInt(left) || !isLiteralInt(right)) return; // only a problem if fully constant

        left.expr = scope.temp(expr, ExprCopy.copy(left), this, scope, ancestor).expr;
    }

    private function isLiteralInt(e: HxbTypedExpr): Bool {
        return switch e.expr {
            case TConst(TInt(_)): true;
            case TParenthesis(inner) | TCast(inner, _): isLiteralInt(inner);
            case _: false;
        }
    }

    private function needsOverflowGuard(t: HxbType): Bool {
        if (t == null) {
            return false;
        }

        return switch t {
            case TAbstract({ name: "Int" | "UInt", pack: [] }, _) | TInt: true;
            case _: false;
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
                left.expr = switch left.expr {
                    case TArray(e, idx): {
                        TArray(
                            scope.temp(expr, e, this, scope, ancestor),
                            scope.temp(expr, idx, this, scope, ancestor)
                        );
                    }

                    case _: left.expr;
                }

                expr.expr = TBinop(
                    OpAssign,
                    ExprCopy.copy(left),
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
                else if (op.match(OpAdd) || op.match(OpSub) || op.match(OpMult)) ensureNonConstArith(expr, left, right, scope, ancestor);

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
                    c = ExprHelper.createCallStatic(context, { name: "HxDynamic", moduleName: "HxDynamic", pack: ['go', 'haxe'] }, "toBool", [ExprCopy.copy(econd)]);
                }

                var newCond = new HxbTypedExpr(TIf(
                    ensureParen(new HxbTypedExpr(TUnop(OpNot, false, ExprCopy.copy(c)), null, null)),
                    ensureBlock(new HxbTypedExpr(TBreak, null, null)),
                    null
                ), null, null);

                if (normalWhile) exprs.unshift(newCond);
                else exprs.push(newCond);

                ebody.expr = TBlock(exprs);
                econd.expr = ensureParen(new HxbTypedExpr(TConst(TBool(true)), null, null)).expr;

                var local = scope.copy();
                local.activeLoop = expr;
                local.activeSwitch = null;

                return iterateExpr(expr, local, ancestor);
            }

            case TWhile(econd, ebody, normalWhile):
                var local = scope.copy();

                econd.expr = ensureParen(econd).expr;
                ebody.expr = ensureBlock(ebody).expr;
                local.activeLoop = expr;
                local.activeSwitch = null;
                local.activeTryOwnsBreak = false;

                return iterateExpr(expr, local, ancestor);

            case TIf(econd, eif, eelse):
                econd.expr = ensureParen(econd).expr;
                eif.expr = ensureBlock(eif).expr;

                if (eelse != null) {
                    eelse.expr = ensureBlock(eelse).expr;
                }

            case TUnop(op, _, e) if (op.match(OpIncrement | OpDecrement) && e.expr.match(TArray(_))):
                toExpr(expr, scope, ancestor); // ugly hack
                toStmt(expr, scope, ancestor);

            case TUnop(op, false, e) if (op.match(OpIncrement | OpDecrement)):
                expr.expr = TUnop(op, true, e); // at this point it is guarenteed to be used as a stmt, so we can just use x++

            case TLocal(v):
                expr.expr = scope.getLocal(v);

            case TVar(v, e):
                expr.expr = scope.defineLocal(v, e);

            case TSwitch(_, cases, edef):
                var local = scope.copy();
                local.activeSwitch = expr;

                for (c in cases) c.expr.expr = ensureBlock(c.expr).expr;
                if (edef != null) edef.expr = ensureBlock(edef).expr;
                return iterateExpr(expr, local, ancestor);

            case TFunction(tfunc):
                var local = scope.copy();
                local.activeFunction = expr;
                local.activeTry = null;
                local.activeTryOwnsBreak = false;
                local.activeLoop = null;
                local.activeSwitch = null;
                // stop collisions with the args
                for (a in tfunc.args) {
                    var argName: String = a.v.name;
                    local.variableAliases.remove(argName);
                }
                return iterateExpr(expr, local, ancestor);

            case TTry(_, _):
                var local = scope.copy();
                if (local.activeTry != null) {
                    local.activeFunction = local.activeTry;
                }

                local.activeTry = expr;
                local.activeTryOwnsBreak = true;

                var allPathsReturn = local.activeSwitchAllPathsReturn ? local.activeSwitchAllPathsReturn : Semantics.allPathsReturn(expr).allPathsReturn;
                local.activeSwitchAllPathsReturn = Semantics.allPathsReturn(expr).allPathsReturn;

                iterateExpr(expr, local, ancestor);

                var returnHandlerStringBuf = new StringBuf();
                var tryNode = expr;

                if (local.activeFunction != null) {
                    switch local.activeFunction.expr {
                        case TFunction(tfunc):
                            var varStringBuf = new StringBuf();
                            var isVoid = tfunc.t.match(TVoid);

                            if (allPathsReturn && !isVoid) {
                                returnHandlerStringBuf.add('\nreturn hx_try_return');
                            } else if (allPathsReturn && isVoid) {
                                returnHandlerStringBuf.add('\nreturn');
                            } else if (!isVoid) {
                                returnHandlerStringBuf.add('if hx_try_state == 1 {\nreturn hx_try_return\n}');
                            } else {
                                returnHandlerStringBuf.add('if hx_try_state == 1 {\nreturn\n}');
                            }

                            if (!isVoid) {
                                varStringBuf.add('var hx_try_return ${context.getWriter().types.writeHxbType(tfunc.t)}\n_ = hx_try_return\n');
                            }

                            varStringBuf.add('var hx_try_state int\n;_ = hx_try_state\n');

                            var vars = ExprHelper.createUntyped(varStringBuf.toString(), []);
                            tryNode.expr = ExprHelper.createUntyped('{0}\n{1}', [vars, ExprCopy.copy(tryNode)]).expr;

                        default:
                    }
                }

                if (scope.activeLoop != null) {
                    returnHandlerStringBuf.add('\nif hx_try_state == 2 {\n\tbreak\n}\nif hx_try_state == 3 {\n\tcontinue\n}');
                }

                var returnHandler = ExprHelper.createUntyped(returnHandlerStringBuf.toString(), []);
                tryNode.expr = ExprHelper.createUntyped('{\n{0}\n{1}\n}', [ExprCopy.copy(tryNode), returnHandler]).expr;

                return;

            case TBreak if (scope.activeSwitch != null && scope.activeLoop != null):
                var label = loopLabels.get(scope.activeLoop);
                if (label == null) {
                    label = 'hx_label_${labelId++}';
                    loopLabels.set(scope.activeLoop, label);
                    scope.activeLoop.expr = ExprHelper.createUntyped('${label}:\n{0}', [ switch scope.activeLoop.expr {
                        case TWhile(econd, e, norm): new HxbTypedExpr(TWhile(econd, e, norm), scope.activeLoop.t, scope.activeLoop.pos);
                        case _: ExprCopy.copy(scope.activeLoop);
                    } ]).expr;
                }

                expr.expr = ExprHelper.createUntyped('break ${label}', []).expr;

            case TReturn(e) if (scope.activeTry != null):
                expr.expr = e == null
                ? ExprHelper.createUntyped('hx_try_state = 1; return', []).expr
                : ExprHelper.createUntyped('hx_try_state = 1; hx_try_return = {0}; return', [ExprCopy.copy(e)]).expr;

            case TBreak if (scope.activeTryOwnsBreak):
                expr.expr = ExprHelper.createUntyped('hx_try_state = 2; return', []).expr;

            case TContinue if (scope.activeTryOwnsBreak):
                expr.expr = ExprHelper.createUntyped('hx_try_state = 3; return', []).expr;

            case _: null;
        }

        iterateExpr(expr, scope, ancestor);
    }

    public function toExpr(expr: HxbTypedExpr, scope: Scope, ancestor: Null<Ancestor>): Void {
        var result = switch expr.expr {
            case TBlock(exprs):
                scope.hoist(exprs, this, scope, ancestor);

            case TBinop(OpAssign | OpAssignOp(_), left, right):
                scope.insert(expr, ExprCopy.copy(expr), this, scope, ancestor);
                scope.temp(expr, left, this, scope, ancestor);

            case TUnop(op, postFix, e) if (op.match(OpIncrement | OpDecrement)): {
                switch removeCast(e).expr {
                    case TArray(_, idx):
                        var idxTmp = scope.temp(expr, idx, this, scope, ancestor);
                        idx.expr = idxTmp.expr;
                        idx.t = idxTmp.t;
                    case _:
                }

                var inc = new HxbTypedExpr(TBinop(
                    OpAssignOp(op.match(OpIncrement) ? OpAdd : OpSub),
                    removeCast(ExprCopy.copy(e)),
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
                    e.expr = TBinop(OpAssign, result, ensureBlock(ExprCopy.copy(e)));
                };

                makeAssign(eif);
                if (eelse != null) makeAssign(eelse);

                scope.insert(expr, ExprCopy.copy(expr), this, scope, ancestor);

                result;
            }

            case TSwitch(_, cases, edef): {
                var result = scope.temp(expr, null, this, scope, ancestor, expr.t);
                var makeAssign = (e: HxbTypedExpr) -> {
                    e.expr = TBinop(OpAssign, result, ensureBlock(ExprCopy.copy(e)));
                };

                for (c in cases) makeAssign(c.expr);
                if (edef != null) makeAssign(edef);

                scope.insert(expr, ExprCopy.copy(expr), this, scope, ancestor);

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
        if (expr.t != null && expr.t.match(TVoid)) {
            return;
        }

        expr.expr = TBinop(
            OpAssign,
            new HxbTypedExpr(TIdent('_'), TVoid, null),
            ExprCopy.copy(expr)
        ); // TODO: if no side effects, it may be omitted.
    }

}