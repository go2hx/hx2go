package translator;

import sys.FileSystem;
import haxe.io.Path;
import sys.io.File;
import haxe.macro.PositionTools;
import haxe.macro.Printer;
import haxe.macro.Expr;
import translator.exprs.*;
import translator.TranslatorTools;
import HaxeExpr.HaxeTypeDefinition;
import HaxeExpr.HaxeField;
import haxe.macro.ComplexTypeTools;

/**
 * Translates Haxe AST to Go AST (strings for now TODO)
 */
@:structInit
class Translator {

    public var module: Module = null;

    public inline function translateComplexType(ct:ComplexType):String {
        return switch ct {
            case TPath(p):
                if (p.sub != null) {
                    p.sub; // TODO: we need to make a distinction between a.T and b.T
                } else if (p.pack.length == 0) {
                    p.name;
                } else {
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
                case EContinue:
                    Continue.translateContinue(this);
                default:
                    //trace("UNKNOWN EXPR TO TRANSLATE:" + e.def);
                    "_ = 0";
            }
        return "";
    }
    public function translateDef(def:HaxeTypeDefinition):String {
        var buf = new StringBuf();

        for (field in def.fields) {
            final name = field.isStatic ? 'Hx_${modulePathToPrefix(def.name)}_${toPascalCase(field.name)}_Field' : toPascalCase(field.name);
            final expr:HaxeExpr = field.expr;

            switch field.kind {
                case FFun(_):
                    switch expr.def {
                        case EFunction(kind, f):
                            if (field.pos != null)
                                buf.add(commentJumpTo(field.pos));

                            buf.add(translator.exprs.Function.translateFunction(this, name, f, def, field.isStatic) + "\n");
                        default:
                            Logging.translator.error('expr.def failure field:' + field.name);
                            throw "expr.def is not EFunction: " + expr.def;
                    }
                case FVar:
//                    buf.add('var $name'); // TODO: typing
//                    if (expr != null)
//                        buf.add(translateExpr(expr));
//                    buf.add("\n");
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

    public function translateParamDecl(params: Array<TypeParamDecl>): String {
        return params.length > 0 ? '[${params.map(p -> '${p.name} any').join(', ')}]' : '';
    }

    public function translateParamUse(params: Array<TypeParamDecl>): String {
        return params.length > 0 ? '[${params.map(p -> '${p.name}').join(', ')}]' : '';
    }

    public function translateClassDef(def: HaxeTypeDefinition): String {
        if (def.isExtern) {
            return "";
        }

        // TODO: check if impl of abstract is extern

        var buf = new StringBuf();
        var staticsBuf = new StringBuf();
        var initBuf = new StringBuf();
        var typeParamDeclStr = translateParamDecl(def.params);
        var typeParamUsageStr = translateParamUse(def.params);

        final className = 'Hx_${modulePathToPrefix(def.name)}_Obj';

        buf.add('var ${className}_ClassType *Hx_runtime_hxclass_Obj = Hx_runtime_hxclass_Obj_CreateInstance("${def.name}", ${def.superClass != null ? 'Hx_${modulePathToPrefix(def.superClass)}_Obj_ClassType' : 'nil'})\n');
        buf.add('type ${className}_VTable${typeParamDeclStr} interface {\n');

        var vTableAssignmentBuf = new StringBuf();
        var superClass = def.superClass;
        var fieldName = "obj.Super";
        var constructor: HaxeField = def?.constructor;

        if (superClass != null) {
            buf.add('\tHx_${modulePathToPrefix(def.superClass)}_Obj_VTable\n'); // TODO: type params
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

            if (constructor == null && td.constructor != null) {
                constructor = td.constructor;
            }

            vTableAssignmentBuf.add('\t${fieldName} = &obj.Hx_${modulePathToPrefix(superClass)}_Obj\n');
            vTableAssignmentBuf.add('\t${fieldName}.VTable = obj\n');

            fieldName += '.Super';
            superClass = td.superClass;
        }

        for (field in def.fields) {
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

        buf.add('\t__HxClass() *Hx_runtime_hxclass_Obj\n');
        buf.add('}\n\n');
        buf.add('type ${className}${typeParamDeclStr} struct {\n');

        if (def.superClass != null) {
            buf.add('\tHx_${modulePathToPrefix(def.superClass)}_Obj\n'); // TODO: type params
            buf.add('\tSuper *Hx_${modulePathToPrefix(def.superClass)}_Obj\n'); // TODO: type params
        }

        buf.add('\tVTable ${className}_VTable${typeParamUsageStr}\n'); // TODO: add superClass to struct

        for (field in def.fields) {
            final ct = HaxeExprTools.stringToComplexType(field.t);
            module.transformer.transformComplexType(ct);

            switch field.kind {
                case FVar | FProp("default", _) | FProp(_, "default") if (field.isStatic): {
                    var typeStr = translateComplexType(ct);
                    var fieldName = toPascalCase(field.name);

                    staticsBuf.add('var Hx_${modulePathToPrefix(def.name)}_${fieldName}_Field ${typeStr}');

                    if (field.expr != null) {
                        initBuf.add('func ${className}_InitField_${fieldName}() ${typeStr} {\n'); // we do it this way to support EIE while keeping initialisation order correct.
                        initBuf.add('\t' + translateExpr({
                            t: null,
                            def: EReturn(switch field?.expr?.def {
                                case EBinop(OpAssign, { def: EConst(CIdent("_")) }, inner): inner; // undo stmt -> expr conversion
                                case _: field.expr;
                            })
                        }) + '\n');
                        initBuf.add('}\n\n');
                        staticsBuf.add(' = ${className}_InitField_${fieldName}()');
                    }

                    staticsBuf.add('\n');
                }

                case FVar | FProp("default", _) | FProp(_, "default") if (!field.isStatic): {
                    buf.add('\t${toPascalCase(field.name)} ${translateComplexType(ct)}\n');
                }

                case _: null;
            }
        }

        buf.add('}\n\n');

        var prmStr: Array<String> = [];
        var argStr: Array<String> = [];
        var constructorStr = '';

        switch constructor?.kind {
            case FFun(_):
                switch constructor.expr.def {
                    case EFunction(kind, f):
                        module.transformer.transformExpr(constructor.expr);
                        constructorStr = translator.exprs.Function.translateFunction(this, 'New', f, def, false) + "\n";

                        for (a in f.args) {
                            prmStr.push('${a.name}${a.type != null ? ' ${translateComplexType(a.type)}' : ''}');
                            argStr.push(a.name);
                        }
                    default:
                        Logging.translator.error('expr.def failure for constructor');
                        throw "expr.def is not EFunction: " + constructor.expr.def;
                }
            default:
        }

        buf.add('func ${className}_CreateEmptyInstance${typeParamDeclStr}() *${className}${typeParamUsageStr} {\n');
        buf.add('\tobj := &${className}${typeParamUsageStr}{}\n');
        buf.add('\tobj.VTable = obj\n'); // TODO: also set vtable on the entire hierarchy of super classes

        buf.add(vTableAssignmentBuf.toString());

        buf.add('\treturn obj\n');
        buf.add('}\n\n');

        buf.add('func ${className}_CreateInstance${typeParamDeclStr}(${prmStr.join(', ')}) *${className}${typeParamUsageStr} {\n');
        buf.add('\tobj := ${className}_CreateEmptyInstance${typeParamUsageStr}()\n');
        if (constructor != null) buf.add('\tobj.New(${argStr.join(', ')})\n');
        buf.add('\treturn obj\n');
        buf.add('}\n\n');

        buf.add('func (this *${className}${typeParamUsageStr}) __HxClass() *Hx_runtime_hxclass_Obj {\n');
        buf.add('\treturn ${className}_ClassType\n');
        buf.add('}\n\n');

        buf.add(constructorStr);

        var staticsStr = staticsBuf.toString();
        if (staticsStr.length != 0) {
            staticsStr += "\n";
        }

        return staticsStr + initBuf.toString() + buf.toString();
    }
}

private function toLocationLine(pos:Position):Int {
    final lines = Util.normalizeCLRF(File.getContent(pos.file)).split("\n");
    var current = 0;
    for (i in 0...lines.length) {
        if (current + lines[i].length > pos.min) {
            return i + 1;
        }
        current += lines[i].length + 1;
    }
    return 0;
}

private function commentJumpTo(pos:Position):String {
    final isWindows = Sys.systemName().toLowerCase() == "windows";
    final path = FileSystem.absolutePath(pos.file);
    var location = path + "#L" + toLocationLine(pos);
    if (isWindows) {
        location = haxe.io.Path.normalize(location);
        location = "/" + location;
    }
    return '//file://$location\n';
}