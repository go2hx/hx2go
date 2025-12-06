package translator;

import haxe.macro.Expr;
import translator.exprs.*;
import HaxeExpr.HaxeTypeDefinition;

/**
 * Translates Haxe AST to Go AST (strings for now TODO)
 */
@:structInit
class Translator {
    public function translateExpr(e:HaxeExpr):String {
        if (e.def != null)
            return switch e.def {
                case ECall(e, params):
                    Call.translateCall(this, e,params);
                case EBlock(exprs):
                    Block.translateBlock(this, exprs);
                case EField(e, field, kind):
                    FieldAccess.translateFieldAccess(this, e, field, kind);
                case EConst(c):
                    Const.translateConst(this, c);
                default:
                    "_ = 0";
            }
        return "";
    }
    public function translateDef(def:HaxeTypeDefinition):String {
        var buf = new StringBuf();
        var impString = "";
        for (imp in def.goImports)
            buf.add('import "$imp"\n');

        for (field in def.fields) {
            final name = title(field.name);
            var expr = "";
            if (field.expr != null)
                expr = translateExpr(field.expr);
            switch field.kind {
                case FFun(f):
                    buf.add('func $name() $expr\n');
                case FVar:
                    buf.add('var $name');
                    if (expr != null)
                        buf.add(expr);
                    buf.add("\n");
                case FProp(get, set):
                    buf.add('//FPROP\nvar $name');
                    if (expr != null)
                        buf.add(expr);
                    buf.add("\n");
                default:
            }
        }
        return buf.toString();
    }

    public function title(s:String) {
        return s.charAt(0).toUpperCase() + s.substr(1);
    }
}