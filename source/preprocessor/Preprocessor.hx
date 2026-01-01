package preprocessor;

import HaxeExpr;
import HaxeExpr.HaxeTypeDefinition;
import haxe.macro.Expr;

/**
 * Gets rid of the bulk of Haxe language features that make working with it a nightmare.
 * The difference compared to the transformer is that the transformer converts things to work and the preprocessor removes things.
 */
@:structInit
class Preprocessor {

    public var module: Module = null;
    public var def: HaxeTypeDefinition = null;
    public var annonymiser: Annonymiser = {};

    public function processExpr(e: HaxeExpr, scope: Scope) {
        if (e?.def == null || e.flags & Processed != 0) {
            return;
        }

        var localScope: Scope = {};
        iterateExprPre(e, localScope);

        if (!Semantics.canHold(e.parent, e)) {
            var res = switch Semantics.getExprKind(e) {
                case Expr: toStmt(e, scope); // expr -> stmt (by `_ = expr`)
                case Stmt: toExpr(e, scope); // stmt -> expr (by kind-specific extraction)
                case EitherKind: e;
            };

            e.copyFrom(res);
        }

        switch e.def {
            // ensure semantics
            case EBinop(op, e0, e1) if (op != OpAssign && !op.match(OpAssignOp(_))): Semantics.ensure(e, [e0, e1], this, localScope);
            case ECall(_, params): Semantics.ensure(e, params, this, localScope);

            // prefix unop inc/dec as stmt
            // we do not care about the result so we transform it to a postFix unop
            case EUnop(op, false, l) if (op == OpIncrement || op == OpDecrement): {
                e.def = EUnop(op, true, l);
                iterateExprPost(e, localScope);
            }

            // normalise body
            case EIf(cond, eif, eelse): {
                ensureParenthesis(cond);
                ensureBlock(eif);
                ensureBlock(eelse);
                iterateExprPost(e, localScope);
            }

            // extract while loop conditional to the body so that extraction makes sense
            case EWhile(cond, body, norm): {
                ensureParenthesis(cond);
                ensureBlock(body);

                var expr: HaxeExpr = {
                    t: null,
                    def: EIf(
                        {
                            t: null,
                            def: EUnop(OpNot, false, cond.copy())
                        },
                        {
                            t: null,
                            def: EBlock([
                                {
                                    t: null,
                                    def: EBreak
                                }
                            ])
                        },
                        null
                    )
                };

                insertExprs([ expr ], body, 0, localScope);
                processExpr(expr, scope);

                cond.def = EConst(CIdent('true'));
            }

            // default
            case _: iterateExprPost(e, localScope);
        }

        localScope.finalise();
        e.flags |= Processed;
    }

    public function toExpr(stmt: HaxeExpr, scope: Scope): HaxeExpr {
        var copy = stmt.copy();
        var result = copy;

        switch copy.def {
            case EBlock(exprs): { // annonymise -> get last -> iterate over exprs -> insert exprs -> (iterate over last)
                annonymiser.annonymise(copy);

                var last = exprs.pop();
                iterateExprPost(copy, scope);
                insertExprsBefore(exprs, copy, scope);

                last.parent = result.parent;
                last.parentIdx = result.parentIdx;
                result = last;
            };

            case EUnop(op, postFix, e) if (op == OpIncrement || op == OpDecrement): {
                var tmp = annonymiser.assign(e);
                var act: HaxeExpr = {
                    t: null,
                    def: EBinop(OpAssign, e, {
                        t: null,
                        def: EBinop(op == OpIncrement ? OpAdd : OpSub, e, {
                            t: null,
                            def: EConst(CInt('1'))
                        })
                    })
                };

                iterateExprPost(copy, scope);
                insertExprsBefore(switch postFix {
                    case true:  [ tmp.decl, act ];
                    case false: [ act, tmp.decl ];
                }, copy, scope);

                result = tmp.ident;
            }

            case EBinop(OpAssignOp(op), e1, e2): {
                var tmp = annonymiser.assign(e1);
                var act: HaxeExpr = {
                    t: null,
                    def: EBinop(OpAssign, e1, {
                        t: null,
                        def: EBinop(op, e1, e2)
                    })
                };

                iterateExprPost(copy, scope);
                insertExprsBefore([
                    act, tmp.decl
                ], copy, scope);

                result = tmp.ident;
            }

            case EBinop(OpAssign, e1, e2): {
                var tmp = annonymiser.assign(e1);

                iterateExprPost(copy, scope);
                insertExprsBefore([
                    copy.copy(), tmp.decl
                ], copy, scope);

                result = tmp.ident;
            }

            case _: trace('cannot transform to expr:', stmt); stmt;
        }

        return result;
    }

    public function toStmt(expr: HaxeExpr, scope: Scope): HaxeExpr {
        var inner: HaxeExpr = expr.copy();
        var outer: HaxeExpr = { t: null, def: EBinop(Binop.OpAssign, { t: null, def: EConst(CIdent("_")) }, inner) };
        inner.parent = expr;
        inner.parentIdx = 0;

        return outer; // `e` -> `_ = e`
    }

    public function iterateExprPre(e: HaxeExpr, scope: Scope) {
        var idx = 0;
        HaxeExprTools.iter(e, l -> {
            l.parent = e;
            l.parentIdx = idx++;
        });
    }

    public function iterateExprPost(e: HaxeExpr, scope: Scope) {
        var children = [];
        HaxeExprTools.iter(e, child -> children.push(child));

        for (child in children) {
            processExpr(child, scope);
        }
    }

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

                case _: null;
            }

            if (field.expr != null) {
                field.expr.parent = { t: null, def: EBlock([]) };
                field.expr.parentIdx = 0;

                var scope: Scope = {};
                processExpr(field.expr, scope);
                scope.finalise();
            }
        }
    }

    public function getOuterBlock(e: HaxeExpr): { block: HaxeExpr, at: Int } {
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

    public function insertExprs(exprs: Array<HaxeExpr>, into: HaxeExpr, at: Int, scope: Scope) {
        var arr = switch (into.def) {
            case EBlock(x): x;
            case _: null;
        }

        if (arr == null) {
            trace('insertExprs arr should not be null');
            return;
        }

        var pos = at;
        for (i in 0...exprs.length) {
            exprs[i].parent = into;
            exprs[i].parentIdx = pos;
            arr.insert(pos, exprs[i]);
            pos++;
        }

        for (i in pos...arr.length) {
            arr[i].parentIdx = i;
        }
    }

    public function insertExprsBefore(exprs: Array<HaxeExpr>, p: HaxeExpr, scope: Scope) {
        var pos = getOuterBlock(p);
        insertExprs(exprs, pos.block, pos.at, scope);
    }

    public function ensureBlock(e: HaxeExpr) {
        if (e == null) {
            return;
        }

        e.def = switch (e.def) {
            case EBlock(_): e.def;
            case _: EBlock([e.copy()]);
        }
    }

    public function ensureParenthesis(e: HaxeExpr) {
        if (e == null) {
            return;
        }

        e.def = switch (e.def) {
            case EParenthesis(_): e.def;
            case _: EParenthesis(e.copy());
        }
    }

}
