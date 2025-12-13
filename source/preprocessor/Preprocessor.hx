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
    public var module:Module = null;
    public var def:HaxeTypeDefinition = null;

    public function processExpr(e:HaxeExpr) {
        if (e?.def == null) {
            return;
        }

        switch e.def {
            default:
                iterateExpr(e);
        }
    }

    public function annonymiseExpr(e:HaxeExpr):HaxeExpr {
        return switch (e.def) {
            case _: e;
        }
    }

    public function iterateExpr(e:HaxeExpr) {
        HaxeExprTools.iter(e, processExpr);
    }

    public function processDef(def:HaxeTypeDefinition) {
        if (def.fields == null)
            return;
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
            if (field.expr != null)
                processExpr(field.expr);
        }
    }
}
