package preprocessor;

import HaxeExpr;
import HaxeExpr.HaxeTypeDefinition;
import HaxeExpr.HaxeTypeDefinition;
import haxe.macro.Expr.TypeDefinition;
import haxe.macro.ComplexTypeTools;
import haxe.macro.Expr;
import transformer.exprs.*;

/**
 * Gets rid of the bulk of Haxe language features that make working with it a nightmare.
 * The difference compared to the transformer is that the transformer converts things to work and the preprocessor removes things.
 */
@:structInit
class Preprocessor {
    public var module: Module = null;
    public var def: HaxeTypeDefinition = null;
    public var annonymiser: Annonymiser = {};

    public function processExpr(e: HaxeExpr) {
        if (e?.def == null) {
            return;
        }

        if (!Semantics.canHold(e.parent, e)) {
            var res = switch Semantics.getExprKind(e) {
                case Expr: toStmt(e); // expr -> stmt (by `_ = expr`)
                case Stmt: toExpr(e); // stmt -> expr (by kind-specific extraction)
                case EitherKind: e;
            };

            e.copyFrom(res);
        }

        switch e.def {
            case _: iterateExpr(e);
        }
    }

    public function toExpr(stmt: HaxeExpr): HaxeExpr {
        return switch stmt.def {
            case EBlock(exprs): {
                var copy = stmt.copy();
                annonymiser.annonymise(copy);

                copy;
            };

            case _: trace('cannot transform to expr:', stmt); stmt;
        }
    }

    public function toStmt(expr: HaxeExpr): HaxeExpr {
        var inner: HaxeExpr = expr.copy();
        var outer: HaxeExpr = { t: null, def: EBinop(Binop.OpAssign, { t: null, def: EConst(CIdent("_")) }, inner) };
        inner.parent = expr;
        inner.parentIdx = 0;

        return outer; // `e` -> `_ = e`
    }

    public function iterateExpr(e: HaxeExpr) {
        var idx = 0;
        HaxeExprTools.iter(e, l -> {
            l.parent = e;
            l.parentIdx = idx++;
            processExpr(l);
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
                processExpr(field.expr);
            }
        }
    }

}
