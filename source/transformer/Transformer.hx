package transformer;

import haxe.macro.Expr.TypeDefinition;
import haxe.macro.Expr;
import transformer.exprs.*;

/**
 * Transforms Haxe AST to Go ready Haxe AST
 * For example, changes try catch to defer panic pattern
 */
@:structInit
class Transformer {
    public function transformExpr(e:Expr) {
        return switch e.expr {
            case ETry(e, catches):
                Try.transformTry(e, catches);
            default:
                e;
        }
    }
    public function transformDef(def:TypeDefinition) {
        if (def.fields == null)
            return;
        for (field in def.fields) {
            switch field.kind {
                case FVar(t, e) if (e != null):
                    field.kind = FVar(t, transformExpr(e));
                case FFun(f) if (f.expr != null):
                    f.expr = transformExpr(f.expr);
                case FProp(get, set, t, e) if (e != null):
                    field.kind = FProp(get,set, t, transformExpr(e));
                default:
            }
        }
    }
}