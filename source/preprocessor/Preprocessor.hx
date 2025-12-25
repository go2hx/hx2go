package preprocessor;

using StringTools;

import HaxeExpr;
import HaxeExpr.HaxeTypeDefinition;
import HaxeExpr.HaxeTypeDefinition;
import haxe.macro.Expr.TypeDefinition;
import haxe.macro.ComplexTypeTools;
import haxe.macro.Expr;
import transformer.exprs.*;

enum ExprKind {
    Stmt;
    Expr;
    EitherKind; // either `Stmt` or `Expr`, example is ECall(...) which can be used as both.
}

/**
 * Gets rid of the bulk of Haxe language features that make working with it a nightmare.
 * The difference compared to the transformer is that the transformer adds support for language feature (like try-catch) while the preprocessor gets rid of features entirely (like everything is an expr)
 */
@:structInit
class Preprocessor {

    public var module:Module = null;
    public var def:HaxeTypeDefinition = null;
    public var tempId: Int = 0;

    public function processDef(def:HaxeTypeDefinition) {
        if (def.fields == null) {
            return;
        }

        for (field in def.fields) {
            switch field.kind {
                case FFun(_):
                    if (field?.expr?.def == null)
                        field.expr = {
                            t: null,
                            def: EBlock([]),
                        };
                default:
            }

            if (field.expr != null) {
                prepassExpr(field.expr, { t: null, def: EBlock([]) }, 0);
                processExpr(field.expr, {});
            }
        }
    }

    public function prepassExpr(e:HaxeExpr, parent: HaxeExpr, parentIdx: Int) {
        if (e?.def == null) {
            return;
        }

        var idx = 0;
        e.parent = parent;
        e.parentIdx = parentIdx;
        normaliseExpr(e);

        HaxeExprTools.iter(e, (l) -> {
            prepassExpr(l, e, idx);
            idx++;
        });
    }

    public function normaliseExpr(e:HaxeExpr) {
        if (e?.def == null) return;
        switch e.def {
            case EWhile(e0, e1, _):
                normaliseParenthesis(e0);
                normaliseBlock(e1);
            case EIf(e0, e1, e2):
                normaliseParenthesis(e0);
                normaliseBlock(e1);
                normaliseBlock(e2);
            case _: null;
        }
    }

    public function normaliseBlock(e:HaxeExpr) {
        if (e?.def == null) return;
        switch e.def {
            case EBlock(_): null;
            case _: e.def = EBlock([ e.copy() ]);
        }
    }

    public function normaliseParenthesis(e:HaxeExpr) {
        switch e?.def {
            case EParenthesis(_): null;
            case _: e.def = EParenthesis(e.copy());
        }
    }

    public function processExpr(e:HaxeExpr, scope:PreprocessorScope) {
        if (e?.def == null) {
            return;
        }

        if (!canHold(e.parent, e, scope)) {
            switch getExprKind(e, scope) {
                case Expr: toStmt(e, scope); // expr -> stmt (by `_ = expr`)
                case Stmt: toExpr(e, scope); // stmt -> expr (by kind-specific extraction)
                case EitherKind: null;
            }
        }

        // sometimes special handling needs to be done in order to ensure other transformations correctly apply
        switch e.def {
            // ensure all children are extracted if any of them will be transformed or otherwise have any side effects
            case EBinop(_, e0, e1): ensureSemantics(e, [e0, e1], scope);
            case ECall(_, params): ensureSemantics(e, params, scope);

            // extract conditional to body
            case EWhile(outerCond, body, norm): // if cond is `Stmt` (like EBlock(...) or EIf(...)) we need to extract the conditional to inside of the loop body, as otherwise it might be extracted out of the loop which causes incorrect behaviour.
                switch outerCond.def {
                    case EParenthesis(cond) if (exprContainsStmt(cond, scope)): // while (x) y; -> while (true) if (!x) break; y;
                        var bodyExpr: HaxeExpr = {
                            t: null,
                            def: EIf({
                                t: null,
                                def: EUnop(Unop.OpNot, false, {
                                    t: null,
                                    def: EParenthesis(cond.copy())
                                })
                            }, {
                                t: null,
                                def: EBlock([
                                    {
                                        t: null,
                                        def: EBreak
                                    }
                                ])
                            }, null)
                        };

                        prepassExpr(bodyExpr, body, 0);
                        insertExprs([bodyExpr], body, 0);
                        e.def = EWhile(null, body, norm);

                    case _: null;
                }

            // special handling for prefix OpIncrement / OpDecrement as stmt
            case EUnop(op, postFix, expr) if (!postFix && (op == OpIncrement || op == OpDecrement)):
                // this code will be ran if "++e" is used as a statement, this implies we don't care about the result of this EUnop(...)
                // we transform it to postFix as it will result in the same value of `e` but without extracting it to a temporary, furthermore, if it is already postFix it should just work.
                // if we DO use the resulting value of the EUnop this code path won't be reached: it should be handled by the EUnop(...) case in `Preprocessor#toExpr(...)`
                e.def = EUnop(op, true, expr);

            case _: null;
        }

        iterateExpr(e, scope);
    }

    public function ensureSemantics(p: HaxeExpr, children: Array<HaxeExpr>, scope: PreprocessorScope): Void {
        var willMutate = false;
        for (c in children) {
            willMutate = willMutate || (hasSideEffects(c, scope) || exprContainsStmt(c, scope));
        }

        if (!willMutate) {
            return;
        }

        trace('need ensure semantics', p);
    }

    public function exprContainsStmt(e:HaxeExpr, scope:PreprocessorScope): Bool {
        var res = false;
        HaxeExprTools.iter(e, (l) -> {
            res = res || exprContainsStmt(l, scope);
        });

        if (getExprKind(e, scope) == Stmt) {
            res = true;
        }

        return res;
    }

    public function iterateExpr(e:HaxeExpr, scope:PreprocessorScope) {
        HaxeExprTools.iter(e, processExpr.bind(_, scope));
    }

    public function insertExprs(exprs: Array<HaxeExpr>, into: HaxeExpr, at: Int) {
        var pos = at;
        var arr = switch (into.def) {
            case EBlock(x): x;
            case _: null;
        }

        if (arr == null) {
            trace('insertExprs arr should not be null');
            return;
        }

        for (expr in exprs) {
            expr.parent = into;
            arr.insert(pos, expr);
            pos++;
        }

        for (i in pos...arr.length) {
            arr[i].parentIdx = i;
        }
    }

    public function removeExpr(e: HaxeExpr, scope:PreprocessorScope) {
        if (e?.def == null || e?.parent?.def == null) {
            return;
        }

        var arr = switch (e.parent.def) {
            case EBlock(x): x;
            case _: null;
        }

        if (arr == null) {
            return;
        }

        arr.remove(e);

        for (i in 0...arr.length) {
            arr[i].parentIdx = i;
        }
    }

    public function getOuterBlock(e:HaxeExpr, scope:PreprocessorScope): { block: HaxeExpr, at: Int } {
        var pa = e.parent;
        var po = e.parentIdx;
        while (pa != null) {
            switch (pa.def) {
                case EBlock(_): break;
                case _:
                    po = pa.parentIdx;
                    pa = pa.parent;
            }
        }
        return { block: pa, at: po };
    }

    public function getTempName(id: Int): String {
        return '_temp_$id';
    }

    public function isTempName(name: String): Bool {
        return name.startsWith("_temp_");
    }

    public function toExpr(stmt: HaxeExpr, scope: PreprocessorScope) {
        switch stmt.def {
            case EBlock(exprs):
                var annonymise: (HaxeExpr, Map<String, String>) -> Void;

                annonymise = (e: HaxeExpr, anonMap: Map<String, String>) -> {
                    if (e?.def == null) return;
                    switch (e.def) {
                        case EVars(vars): for (v in vars) {
                            if (isTempName(v.name)) continue;
                            var name = getTempName(tempId++);
                            anonMap[v.name] = name;
                            v.name = name;
                        }

                        case EConst(CIdent(name)): e.def = EConst(CIdent(anonMap[name] ?? name));
                        case _: null;
                    }

                    HaxeExprTools.iter(e, annonymise.bind(_, anonMap.copy())); // copy because one can shadow variables, and we must account for scopes...
                };

                // annonymise all exprs
                annonymise(stmt, []);

                // fetch info
                var into = getOuterBlock(stmt, scope);
                var last = exprs.pop();

                // insert other exprs
                for (e in exprs) processExpr(e, scope);
                insertExprs(exprs, into.block, into.at);

                // insert last
                last.parent = stmt.parent;
                last.parentIdx = stmt.parentIdx;
                stmt.copyFrom(last);

            case EUnop(OpIncrement, postFix, expr) | EUnop(OpDecrement, postFix, expr):
                var tmpName = getTempName(tempId++);
                var into = getOuterBlock(stmt, scope);

                var toInsert: Array<HaxeExpr> = [
                    {
                        t: null,
                        def: EVars([
                            {
                                name: tmpName,
                                expr: expr.copy()
                            }
                        ])
                    }
                ];

                var incExpr: HaxeExpr = {
                    t: null,
                    def: EBinop(Binop.OpAssign, expr.copy(), {
                        t: null,
                        def: EBinop(Binop.OpAdd, expr.copy(), {
                            t: null,
                            def: EConst(CInt('1'))
                        })
                    })
                };

                if (postFix) toInsert.push(incExpr);
                else toInsert.unshift(incExpr);

                insertExprs(toInsert, into.block, into.at);

                stmt.def = EConst(CIdent(tmpName));

            case EBinop(OpAssign, e1, e2):
                var tmpName = getTempName(tempId++);
                var into = getOuterBlock(stmt, scope);
                insertExprs([
                    stmt.copy(),
                    {
                        t: null,
                        def: EVars([
                            {
                                name: tmpName,
                                expr: e1
                            }
                        ])
                    },
                ], into.block, into.at);

                stmt.def = EConst(CIdent(tmpName));

            case EBinop(OpAssignOp(op), e1, e2):
                var tmpName = getTempName(tempId++);
                var into = getOuterBlock(stmt, scope);
                insertExprs([
                    {
                        t: null,
                        def: EVars([
                            {
                                name: tmpName,
                                expr: {
                                    t: null,
                                    def: EBinop(op, e1, e2)
                                }
                            }
                        ])
                    },
                    stmt.copy()
                ], into.block, into.at);

                stmt.def = EConst(CIdent(tmpName));

            case _: trace('cannot transform to expr:', stmt);
        }
    }

    public function canHoldExpr(expr: HaxeExpr, scope: PreprocessorScope): Bool {
        return switch expr?.def {
            case EBlock(_): false;
            case _: true;
        }
    }

    public function toStmt(expr: HaxeExpr, scope: PreprocessorScope) {
        var inner = expr.copy();
        inner.parent = expr;
        inner.parentIdx = 0;

        expr.def = EBinop(Binop.OpAssign, { t: null, def: EConst(CIdent("_")) }, inner); // `e` -> `_ = e`
        expr.flags = 0;
    }

    public function canHoldStmt(expr: HaxeExpr, scope: PreprocessorScope): Bool {
        return switch expr.def {
            case EBlock(_), EWhile(_), EIf(_): true;
            case _: false;
        }
    }

    public function getExprKind(expr: HaxeExpr, scope: PreprocessorScope): ExprKind {
        return switch expr.def {
            case EBlock(_), EVars(_), EWhile(_, _, _), EIf(_, _, _), EReturn(_), EBinop(OpAssignOp(_), _, _), EBinop(OpAssign, _, _), EUnop(OpIncrement, _, _), EUnop(OpDecrement, _, _), EBreak: Stmt;
            case EConst(_), EField(_, _, _), ECast(_, _), EBinop(_, _, _), EUnop(_, _, _), ENew(_, _), EParenthesis(_): Expr;
            case ECall(_, _): EitherKind;
            case _: trace('unknown kind for:', expr); EitherKind;
        }
    }

    public function hasSideEffects(expr: HaxeExpr, scope: PreprocessorScope): Bool {
        return switch expr.def {
            // TODO: we always assume ECall(...) has side effects, even if that is not the case. If we were to introduce a lookup then the preprocessor can't parralelise per unit (dump file)...
            // is there a way in which we can get the best of both worlds (per unit parallelisation AND side effect flag lookup)?
            // we could potentially make the preprocessor a step after transformation has completed, but, that would significantly complicate the transformation process which we also don't want :(
            case EBinop(OpAssign, _, _), EBinop(OpAssignOp(_), _, _), EUnop(OpIncrement, _, _), EUnop(OpDecrement, _, _), ECall(_, _), ENew(_, _), EReturn(_), EBreak: true;
            case EVars(vars):
                for (v in vars) if (v.expr != null && hasSideEffects(v.expr, scope)) return true;
                false;
            case EBinop(_, e1, e2): hasSideEffects(e1, scope) || hasSideEffects(e2, scope);
            case EUnop(_, _, e), EField(e, _, _), EParenthesis(e), ECast(e, _): hasSideEffects(e, scope);
            case EBlock(exprs):
                for (e in exprs) if (hasSideEffects(e, scope)) return true;
                false;
            case EIf(econd, eif, eelse):
                hasSideEffects(econd, scope) || hasSideEffects(eif, scope) || (eelse != null && hasSideEffects(eelse, scope));
            case EWhile(econd, ebody, _): hasSideEffects(econd, scope) || hasSideEffects(ebody, scope);
            case EConst(_): false;
            case _: trace('unknown if expr has side effects'); true;
        }
    }

    public function canHold(p: HaxeExpr, expr: HaxeExpr, scope: PreprocessorScope): Bool {
        return switch getExprKind(expr, scope) {
            case Stmt: canHoldStmt(p, scope);
            case Expr: canHoldExpr(p, scope);
            case EitherKind: true;
        }
    }

}
