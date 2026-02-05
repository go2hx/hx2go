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

    public var module: Module = null;

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
                    translator.exprs.Function.translateFunction(this, "", f, null, true);
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
            final name = field.isStatic ? 'Hx_${modulePathToPrefix(def.name)}_${toPascalCase(field.name)}' : toPascalCase(field.name);
            final expr:HaxeExpr = field.expr;

            switch field.kind {
                case FFun(_):
                    switch expr.def {
                        case EFunction(kind, f):
                            buf.add(translator.exprs.Function.translateFunction(this, name, f, def, field.isStatic) + "\n");
                        default:
                            Logging.translator.error('expr.def failure field:' + field.name);
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

        if (!def.isExtern) {
            switch (def.kind) {
                case TDClass:
                    buf.add(translateClassDef(def)); // TODO: support interfaces

                case _:
                // ignore
            }
        }

        return buf.toString();
    }

    public function translateClassDef(def: HaxeTypeDefinition): String {
        var buf = new StringBuf();
        final className = 'Hx_${modulePathToPrefix(def.name)}_Obj';

        buf.add('type ${className}_VTable interface {\n');

        var mergedFields = def.fields.copy();
        var inheritedFields = [];
        var vTableAssignmentBuf = new StringBuf();

        var superClass = def.superClass;
        var fieldName = "obj.Super";
        var hasConstructor = false;

        if (def.constructor != null) {
            inheritedFields.push(def.constructor);
            hasConstructor = true;
        }

        while (superClass != null) {
            final ct = HaxeExprTools.stringToComplexType(superClass);
            if (ct == null) {
                break;
            }

            final td = switch ct {
                case TPath(p): module.resolveClass(p.pack, p.name, module.path);
                case _: null;
            }

            if (td == null) {
                break;
            }

            for (f in td.fields) {
                if (!(mergedFields.filter(f2 -> f2.name == f.name).length > 0)) {
                    mergedFields.push(f);
                    inheritedFields.push(f);
                }
            }

            if (!hasConstructor && td.constructor != null) {
                inheritedFields.push(td.constructor);
                hasConstructor = true;
            }

            vTableAssignmentBuf.add('\t${fieldName}.Vtable = obj\n');
            fieldName += '.Super';
            superClass = td.superClass;
        }

        for (field in mergedFields) {
            switch field.kind {
                case FFun(_) if (!field.isStatic):
                    final methodName = toPascalCase(field.name);
                    final expr:HaxeExpr = field.expr;

                    buf.add('\t$methodName(');

                    switch expr.def {
                        case EFunction(kind, f): {
                            var first = true;
                            for (arg in f.args) {
                                if (!first) {
                                    buf.add(', ');
                                }
                                first = false;
                                buf.add(arg.name + ' ' + translateComplexType(arg.type));
                            }
                            buf.add(') ');

                            final returnType = translateComplexType(f.ret);
                            if (returnType != "Void") {
                                buf.add(returnType);
                            }
                        }

                        case _: {
                            Logging.translator.error('expr.def failure field:' + field.name);
                            throw "expr.def is not EFunction: " + expr.def;
                        }
                    }

                    buf.add('\n');

                case _:
            }
        }

        buf.add('}\n\n');

        buf.add('type $className struct {\n');

        if (def.superClass != null) {
            buf.add('Hx_${modulePathToPrefix(def.superClass)}_Obj\n');
            buf.add('\tSuper *Hx_${modulePathToPrefix(def.superClass)}_Obj\n');
        }

        buf.add('\tVtable ${className}_VTable\n'); // TODO: add superClass to struct
        buf.add('}\n\n');

        var prmStr = '';
        var argStr = '';

        buf.add('func ${className}_CreateEmptyInstance() *$className {\n');
        buf.add('\tobj := &$className{}\n');
        buf.add('\tobj.Vtable = obj\n'); // TODO: also set vtable on the entire hierarchy of super classes

        if (def.superClass != null) {
            buf.add('\tobj.Super = Hx_${modulePathToPrefix(def.superClass)}_Obj_CreateEmptyInstance()\n');
        }

        buf.add(vTableAssignmentBuf.toString());

        buf.add('\treturn obj\n');
        buf.add('}\n\n');

        buf.add('func ${className}_CreateInstance($prmStr) *$className {\n');
        buf.add('\tobj := ${className}_CreateEmptyInstance()\n');
        if (hasConstructor) buf.add('\tobj.New()\n');
        buf.add('\treturn obj\n');
        buf.add('}\n\n');

        for (f in inheritedFields) {
            switch f.kind {
                case FFun(_):
                    switch f.expr.def {
                        case EFunction(kind, func):
                            final methodName = toPascalCase(f.name);
                            buf.add('func (obj *$className) $methodName(');

                            var first = true;
                            for (arg in func.args) {
                                if (!first) {
                                    buf.add(', ');
                                }
                                first = false;
                                buf.add(arg.name + ' ' + translateComplexType(arg.type));
                            }
                            buf.add(') ');

                            final returnType = translateComplexType(func.ret);
                            if (returnType != "Void") {
                                buf.add(returnType);
                            }

                            var e = func.expr.copy(); // we copy the expression over instead of forwarding it (obj.Super.X) as it's more efficient and also handles the constructor...
                            module.transformer.transformExpr(e);

                            buf.add(translateExpr(e));

                            first = true;
                            for (arg in func.args) {
                                if (!first) {
                                    buf.add(', ');
                                }
                                first = false;
                                buf.add(arg.name);
                            }

                            buf.add("\n\n");

                        case _: null;
                    }

                case _: null;
            }
        }

        return buf.toString();
    }
}
