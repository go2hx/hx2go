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
            case TFunction(args, ret):
                "func(" + args.map(arg -> translateComplexType(arg)).join(", ") + ")" + translateComplexType(ret);
            case TAnonymous(fields):
                "map[string]any";
            default:
                throw "unknown ct for translateComplexType: " + ct;
        }
    }
    public function translateExpr(e:HaxeExpr):String {
        if (e == null)
            return "#NULL_TRANSLATED_EXPR";
        if (e.def != null)
            return switch e.def {
                case EGoCode(format, exprs):
                    GoCode.translateGoCode(this, format, exprs);
                case EGoSliceConstruct(ct):
                    GoSliceConstruct.translateGoSliceConstruct(this, ct);
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
                case EUntyped(e):
                    Untyped.translateUntyped(this, e);
                case ECast(e, t):
                    Cast.translateCast(this, e, t);
                case EBreak:
                    Break.translateBreak(this);
                case EReturn(e):
                    Return.translateReturn(this, e);
                case EFunction(kind, f):
                    translator.exprs.Function.translateFunction(this, "", f);
                case EObjectDecl(fields):
                    translator.exprs.ObjectDeclaration.translateObjectDeclaration(this, fields);
                case EArrayDecl(values, ct):
                    ArrayDeclaration.translateArrayDeclaration(this, e, values, ct);
                case EArray(e1, e2):
                    translator.exprs.ArrayAccess.translateArrayAccess(this, e1, e2);
                case EThrow(e):
                    Throw.translateThrow(this, e);
                default:
                    //trace("UNKNOWN EXPR TO TRANSLATE:" + e.def);
                    "_ = 0";
            }
        return "";
    }
    public function translateDef(def:HaxeTypeDefinition):String {
        var buf = new StringBuf();

        for (field in def.fields) {
            final name = 'Hx_${modulePathToPrefix(def.module)}_${toPascalCase(field.name)}';
            final expr:HaxeExpr = field.expr;

            switch field.kind {
                case FFun(_):
                    switch expr.def {
                        case EFunction(kind, f):
                            buf.add(translator.exprs.Function.translateFunction(this, name, f));
                        default:
                            trace(field.name);
                            throw "expr.def is not EFunction: " + expr.def;
                    }
                case FVar:
                    buf.add('var $name'); // TODO: typing
                    if (expr != null)
                        buf.add(translateExpr(expr));
                    buf.add("\n");
                case FProp(get, set): // TODO: impl
//                    buf.add('//FPROP\nvar $name');
//                    if (expr != null)
//                        buf.add(expr);
//                    buf.add("\n");
                default:
            }
        }
        return buf.toString();
    }
}
