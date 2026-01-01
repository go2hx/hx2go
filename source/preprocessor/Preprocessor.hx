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
        if (e?.def == null) {
            return;
        }

        if (!Semantics.canHold(e.parent, e)) {
            var res = switch Semantics.getExprKind(e) {
                case Expr: toStmt(e, scope); // expr -> stmt (by `_ = expr`)
                case Stmt: toExpr(e, scope); // stmt -> expr (by kind-specific extraction)
                case EitherKind: e;
            };

            e.copyFrom(res);
        }

        var localScope: Scope = {};
        switch e.def {
            case _: iterateExpr(e, localScope);
        }

        localScope.finalise();
    }

    public function toExpr(stmt: HaxeExpr, scope: Scope): HaxeExpr {
        var copy = stmt.copy();
        var result = copy;

        switch copy.def {
            case EBlock(exprs): { // annonymise -> get last -> iterate over exprs -> insert exprs -> (iterate over last)
                annonymiser.annonymise(copy);

                var last = exprs.pop();
                iterateExpr(copy, scope);
                insertExprsBefore(exprs, stmt, scope);

                result = last;
            };

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

    public function iterateExpr(e: HaxeExpr, scope: Scope) {
        var idx = 0;
        HaxeExprTools.iter(e, l -> {
            l.parent = e;
            l.parentIdx = idx++;
            processExpr(l, scope);
        });
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
        var pos = at;
        var arr = switch (into.def) {
            case EBlock(x): x;
            case _: null;
        }

        if (arr == null) {
            trace('insertExprs arr should not be null');
            return;
        }

        scope.defer(() -> {
            for (expr in exprs) {
                expr.parent = into;
                arr.insert(pos, expr);
                pos++;
            }

            for (i in pos...arr.length) {
                arr[i].parentIdx = i;
            }
        });
    }

    public function insertExprsBefore(exprs: Array<HaxeExpr>, p: HaxeExpr, scope: Scope) {
        var pos = getOuterBlock(p);
        insertExprs(exprs, pos.block, pos.at, scope);
    }

}
