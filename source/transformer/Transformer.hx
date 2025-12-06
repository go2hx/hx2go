package transformer;

import HaxeExpr;
import HaxeExpr.HaxeTypeDefinition;
import HaxeExpr.HaxeTypeDefinition;
import haxe.macro.Expr.TypeDefinition;
import haxe.macro.Expr;
import transformer.exprs.*;

/**
 * Transforms Haxe AST to Go ready Haxe AST
 * For example, changes try catch to defer panic pattern
 */
@:structInit
class Transformer {
    public var module:Module = null;
    public var def:HaxeTypeDefinition = null;
    public function transformExpr(e:HaxeExpr) {
        if (e.def == null)
            return;
        switch e.def {
            case ETry(_, _):
                Try.transformTry(this, e);
            case EField(_, _, _):
                FieldAccess.transformFieldAccess(this, e);
            default:
                HaxeExprTools.iter(e, transformExpr);
        }
    }
    public function transformDef(def:HaxeTypeDefinition) {
        if (def.fields == null)
            return;
        for (field in def.fields) {
            switch field.kind {
                case FFun(_):
                    if (field?.expr?.def == null)
                        field.expr = {
                            t: null,
                            specialDef: null,
                            def: EBlock([]),
                        };
                default:
            }
            if (field.expr != null)
                transformExpr(field.expr);
        }
    }
}