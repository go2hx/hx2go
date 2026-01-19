package preprocessor;

import HaxeExpr;
import HaxeExpr.HaxeTypeDefinition;
import translator.TranslatorTools;
import haxe.macro.Expr;

/**
 * Gets rid of the bulk of Haxe language features that make working with it a nightmare.
 * The difference compared to the transformer is that the transformer converts things to work and the preprocessor removes things.
 * TODO:
 * - Short Circuiting (taking into account EIE)
 * - Test: x[i++] = i;
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

        iterateExprPre(e, scope);

        if (e.parent != null && !Semantics.canHold(e.parent, e)) {
            var res = switch Semantics.getExprKind(e) {
                case Expr: toStmt(e, scope); // expr -> stmt (by `_ = expr`)
                case Stmt: toExpr(e, scope); // stmt -> expr (by kind-specific extraction)
                case EitherKind: e;
            };

            e.copyFrom(res);
        }

        switch e.def {
            // defaults
            case EBinop(OpAssign | OpAssignOp(_), _, _): iterateExprPost(e, scope);

            // ensure semantics
            case EBinop(_, e0, e1): Semantics.ensure(e, [e0, e1], this, scope);
            case ECall(_, params): {
                Semantics.ensure(e, params, this, scope);

                final ct = HaxeExprTools.stringToComplexType(e.t);
                if (ct == null) {
                    return;
                }

                switch ct {
                    case TPath(p) if (p.name == "Tuple" && p.pack[0] == "go"):
                        var info = Semantics.analyzeFunctionCall(this, e);
                        if (!info.isExtern) {
                            return;
                        }

                        handleTuple(e, ct, scope);

                    case _: null;
                }
            }

            // apply var alias
            case EConst(CIdent(name)): e.def = EConst(CIdent(scope.getAlias(name)));

            // register var alias
            case EVars(vars): {
                iterateExprPost(e, scope);

                for (v in vars) {
                    v.name = scope.defineVariable(v.name, this);
                }
            }

            // prefix unop inc/dec as stmt
            // we do not care about the result so we transform it to a postFix unop
            case EUnop(op, false, l) if (op == OpIncrement || op == OpDecrement): {
                e.def = EUnop(op, true, l);
                iterateExprPost(e, scope);
            }

            // normalise body
            case EIf(cond, eif, eelse): {
                ensureParenthesis(cond);
                ensureBlock(eif);
                ensureBlock(eelse);
                iterateExprPost(e, scope.copy());
            }

            // extract while loop conditional to the body so that extraction makes sense
            case EWhile(cond, body, norm) if (Semantics.goingToMutate(cond, e) || Semantics.hasSideEffects(this, cond)): {
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

                insertExprs([ expr ], body, 0, scope);
                processExpr(body, scope.copy());

                cond.def = null;
            }

            // still ensure braces if EWhile(...) with mutation hasn't been reached
            case EWhile(cond, body, _):
                ensureParenthesis(cond);
                ensureBlock(body);
                iterateExprPost(e, scope.copy());

            // default
            case _: iterateExprPost(e, scope);
        }

        e.flags |= Processed;
    }

    public function toExpr(stmt: HaxeExpr, scope: Scope): HaxeExpr {
        var copy = stmt.copy();
        var result = copy;

        switch copy.def {
            case EBlock(exprs): { // annonymise -> get last -> iterate over exprs -> insert exprs -> (iterate over last)
                if (exprs.length == 0) {
                    iterateExprPost(result, scope);
                    return result;
                }

                annonymiser.annonymise(copy);

                var last = exprs.pop();
                iterateExprPost(copy, scope);
                insertExprsBefore(exprs, copy, scope);

                last.parent = result.parent;
                last.parentIdx = result.parentIdx;
                processExpr(last, scope);

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

            case EIf(econd, eif, eelse): {
                ensureParenthesis(econd);
                ensureBlock(eif);
                ensureBlock(eelse);

                var tmp = annonymiser.assign(null, stmt.t);
                var ifStmt = copy.copy();
                var makeLastAssign = (eBranch: HaxeExpr) -> {
                    var arr = switch(eBranch.def) {
                        case EBlock(x): x;
                        case _: null;
                    }

                    if (arr == null) {
                        trace('makeLastAssign branch is not a block');
                        return;
                    }

                    if (arr.length == 0) {
                        return; // empty branch
                    }

                    var last = arr[arr.length - 1];
                    last.def = EBinop(OpAssign, tmp.ident, last.copy());
                };

                makeLastAssign(eif);
                if (eelse != null) makeLastAssign(eelse);

                iterateExprPost(ifStmt, scope);
                insertExprsBefore([
                    tmp.decl, ifStmt
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
                            def: EFunction(null, {expr: {def: EBlock([]), t: ""}, args: []}),
                        };

                case _: null;
            }

            if (field.expr != null) {
                field.expr.parent = { t: null, def: EBlock([]) };
                field.expr.parentIdx = 0;

                var scope: Scope = {};
                switch field.expr.def {
                    case EFunction(_, f):
                        processExpr(f.expr, scope);
                    default:
                        processExpr(field.expr, scope);
                }
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
        // TODO remove?
        if (into == null)
            return;
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

    public function handleTuple(cexpr: HaxeExpr, tupleType: ComplexType, scope: Scope): Void {
        var fields = switch (tupleType) {
            case TPath(p) if (p.params != null && p.params.length == 1):
                switch p.params[0] {
                    case TPType(t2):
                        switch t2 {
                            case TAnonymous(fields):
                                fields;

                            case _:
                                trace('Tuple type parameter is not a TTuple');
                                return;
                        }

                    case _:
                        trace('Tuple type parameter is not a TPType');
                        return;
                }

            case _:
                trace('Tuple type is not a TPath with one parameter');
                return;

        }

        var tmpId = annonymiser.allocId();
        insertExprsBefore([
            {
                t: null,
                def: EVars([
                    {
                        name: '_tuple_' + tmpId,
                        type: tupleType,
                        expr: null
                    }
                ])
            },
            {
                t: null,
                def: EBinop(Binop.OpAssign, {
                    t: null,
                    def: EConst(CIdent(fields.map(f -> '_tuple_$tmpId.${toPascalCase(f.name)}').join(', ')))
                }, cexpr.copy()) // note: cexpr is the call which has already been processed by Semantics#ensure
            }
        ], cexpr, scope);

        cexpr.def = EConst(CIdent('_tuple_' + tmpId));
    }

}
