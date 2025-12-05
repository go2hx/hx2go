package translator;

import haxe.macro.Expr;
import translator.exprs.*;

/**
 * Translates Haxe AST to Go AST (strings for now TODO)
 */
@:structInit
class Translator {
    public function translateExpr(e:Expr):String {
        return switch e.expr {
            case ECall(e, params):
                Call.translateCall(e,params);
            default:
                "";
        }
    }
    public function translateDef(def:TypeDefinition):String {
        var buf = new StringBuf();
        for (field in def.fields) {
            if (field.access.length > 0 && field.access[0] == AStatic) {
                switch field.kind {
                    case FFun(f):
                        buf.add('func ${title(field.name)}() {\n');
                        if (f.expr != null)
                            buf.add(translateExpr(f.expr));
                        buf.add("\n}");
                    default:
                }
            }
        }
        return buf.toString();
    }

    public function title(s:String) {
        return s.charAt(0).toUpperCase() + s.substr(1);
    }
}