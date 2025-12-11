package translator;

import haxe.macro.Printer;
import haxe.macro.Expr;
import translator.exprs.*;
import translator.TranslatorTools;
import HaxeExpr.HaxeTypeDefinition;

/**
 * Translates Haxe AST to Go AST (strings for now TODO)
 */
@:structInit
class Translator {
    public inline function translateComplexType(ct:ComplexType):String {
        return switch ct {
            case TPath(p):
                if (p.pack.length == 0) {
                    p.name;
                }else{
                    p.pack.join(".") + p.name;
                }
            default:
                throw "unknown ct for translateComplexType: " + ct;
        }
    }
    public function translateExpr(e:HaxeExpr):String {
        if (e == null)
            return "#NULL_TRANSLATED_EXPR";
        if (e.def != null)
            return switch e.def {
                case EParenthesis(e):
                    Parenthesis.translateParenthesis(this, e);
                case ECall(e, params):
                    Call.translateCall(this, e,params);
                case EBlock(exprs):
                    Block.translateBlock(this, exprs);
                case EField(e, field, kind):
                    FieldAccess.translateFieldAccess(this, e, field, kind);
                case EConst(c):
                    Const.translateConst(this, c);
                case EIf(econd, eif, eelse):
                    If.translateIf(this, econd, eif, eelse);
                case EVars(vars):
                    VarDeclarations.translateVarsDeclarations(this, vars);
                case EBinop(op, e1, e2):
                    BinopExpr.translateBinop(this, op, e1, e2);
                case EUnop(op, postFix, e):
                    UnopExpr.translateUnop(this, op, postFix, e);
                case EWhile(econd, e, normalWhile):
                    While.translateWhile(this, econd, e, normalWhile);
                case ECheckType(e2, t):
                    CheckType.translateCheckType(this, e2, t);
                default:
                    "_ = 0";
            }
        if (e.specialDef != null) {
            switch e.specialDef {
                case Local:
                    final ident = e.t.substr(0, e.t.indexOf("("));
                   return SpecialLocal.translateSpecialLocal(this, ident);
                default:
            }
        }
        return "";
    }
    public function translateDef(def:HaxeTypeDefinition):String {
        var buf = new StringBuf();
        var impString = "";
        for (imp in def.goImports)
            buf.add('import "$imp"\n');

        for (field in def.fields) {
            final name = toPascalCase(field.name);
            var expr = "";
            if (field.expr != null) {
                expr = translateExpr(field.expr);
            }

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
}


