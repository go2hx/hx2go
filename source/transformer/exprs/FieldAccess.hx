package transformer.exprs;

using StringTools;

import haxe.macro.Expr.EFieldKind;
import HaxeExpr;
import transformer.Transformer;
import translator.Translator;
import translator.TranslatorTools;
import haxe.macro.ComplexTypeTools;
import haxe.macro.Expr.ComplexType;
import haxe.macro.Expr.MetadataEntry;
import haxe.macro.Expr;

function transformFieldAccess(t:Transformer, e:HaxeExpr) {
    switch e.def {
        case EField(e2, field, kind):
            if (resolvePkgTransform(t, e, e2, field, kind)) {
                return;
            }

            var res = resolveExpr(t, e2, field);
            t.transformExpr(e2);

            if (res.transformName) {
                field = toPascalCase(field);
            }

            if (res.isNative) {
                e.def = EField(e2, field, kind);
                return;
            }

            var parentIsCall = switch e?.parent?.def {
                case ECall(ie, _) if (ie == e): true;
                case _: false;
            }

            e.def = switch (e2?.def) {
                case EConst(CIdent("super")):
                    EField({ t: null, def: EField({ t: null, def: EConst(CIdent("this")) }, "Super", kind)}, field, kind); // t is null, so VTable isn't used (static access)

                case _:
                    switch (e?.special) {
                        case FStatic(tstr, _): EConst(CIdent('Hx_${modulePathToPrefix(tstr)}_${field}_Field'));
                        case FInstance(tstr) if (parentIsCall): EField({ t: null, def: EField(e2, 'VTable') }, field, kind);
                        case FInstance(tstr) if (!parentIsCall): EField(e2, field, kind);
                        case _: EField(e2, field, kind);
                    }
            }
        default:
    }
}

function resolveExpr(t:Transformer, e2:HaxeExpr, fieldName:String): { isNative:Bool, transformName:Bool } {
    if (e2.t == null) {
        return { isNative: false, transformName: true };
    }

    try {
        final ct = HaxeExprTools.stringToComplexType(e2.t);
        if (ct == null) {
            return { isNative: false, transformName: true };
        }

        return processComplexType(t, e2, ct);
    } catch (e) {
        Logging.transformer.warn('parsing type failed in FieldAccess, given $e');
        return { isNative: false, transformName: true };
    }
}

function processComplexType(t:Transformer, e2:HaxeExpr, ct:ComplexType): { isNative:Bool, transformName:Bool } {
    var path = switch ct {
        case TPath(p): p;
        case _: return { isNative: false, transformName: true };
    }

    var isInstance = false;
    var innerPath = if (path.name != "Class" || path.pack.length != 0) {
        isInstance = true;
        path;
    } else {
        switch path.params[0] {
            case TPType(TPath(p)): p;
            case _: return { isNative: false, transformName: true };
        }
    }

    final td = t.module.resolveClass(innerPath.pack, innerPath.name, t.module.path);
    if (td == null) {
        return { isNative: false, transformName: true };
    }

    var renamedIdentLeft = "";
    var isNative = false;
    var topLevel = false;
    var transformName = true;

    for (meta in td.meta()) {
        if (meta.name == ":go.TypeAccess") {
            var result = processStructAccessMeta(t, meta, renamedIdentLeft);
            isNative = result.isNative;
            topLevel = result.topLevel;
            transformName = result.transformName;

            if (!isInstance) {
                renamedIdentLeft = result.name;
            }
        }
    }

    if (renamedIdentLeft != "" || topLevel) {
        e2.remapTo = renamedIdentLeft;
    }

    return { isNative: isNative, transformName: transformName };
}

function processStructAccessMeta(t:Transformer, meta:MetadataEntry, defaultName:String):{name:String, isNative:Bool, topLevel:Bool, transformName: Bool} {
    var name = defaultName;
    var isNative = true;
    var topLevel = false;
    var transformName = true;

    var fields = switch meta.params[0].expr {
        case EObjectDecl(fields): fields;
        case _: return {name: name, isNative: isNative, topLevel: topLevel, transformName: transformName};
    }

    for (field in fields) {
        switch field.field {
            case "name":
                name = t.exprToString(field.expr);

            case "topLevel" if (t.exprToString(field.expr).trim() == "true"):
                name = "";
                topLevel = true;

            case "transformName" if (t.exprToString(field.expr).trim() == "false"):
                transformName = false;

            case "imports":
                processImports(t, field.expr);

            case _:
        }
    }

    return {name: name, isNative: isNative, topLevel: topLevel, transformName: transformName};
}

function processImports(t:Transformer, expr:Expr) {
    var values = switch expr.expr {
        case EArrayDecl(values): values;
        case _: return;
    }

    for (v in values) {
        t.def.addGoImport(t.exprToString(v));
    }
}

function resolvePkgTransform(t:Transformer, e:HaxeExpr, e2:HaxeExpr, field:String, kind:EFieldKind):Bool {
    var e2Name: Null<String> = switch e2.def {
        case EConst(CIdent(x)): x;
        case _: null;
    }

    if (e.parent?.def == null) {
        return false;
    }

    if (e?.special != null) {
        final tstr = switch (e.special) {
            case FInstance(x): x;
            case FStatic(x, f): x;
            case Local:
                e2.t;
            case _: "";
        }
        if (tstr == "")
            return false;
        final ct = HaxeExprTools.stringToComplexType(tstr);
        final fieldHandled = handleFieldTransform(t, e, ct, e2, field);
        if (fieldHandled) {
            return true;
        }
    }

    if (e2Name == null) {
        return false;
    }

    return switch e.parent.def {
        case ECall(e, params): handleCallTransform(t, e, params, e2Name, field);
        case _: false;
    }
}

function handleCallTransform(t:Transformer, e:HaxeExpr, params:Array<HaxeExpr>, e2Name:String, field:String):Bool {
    var transformed = switch [e2Name, field] {
        case ['go.Syntax', 'code']:
            e.parent.def = EGoCode(t.exprToString(params.shift()), params);
            true;

        case ['go._Slice.Slice_Impl_', '_create']:
            final ct = HaxeExprTools.stringToComplexType(e.parent.t);
            t.transformComplexType(ct);
            e.parent.def = EGoSliceConstruct(ct);
            true;

        case _:
            false;
    }

    if (transformed) {
        t.iterateExpr(e); // mikaib: e.parent or e?
    }

    return transformed;
}

function handleFieldTransform(t:Transformer, e:HaxeExpr, ct:ComplexType, e2:HaxeExpr, field:String):Bool {
    var transformed = switch ct {
        case TPath({name: "Array", pack: []}) if (field == "length"):
            e.def = EGoCode('len(*{0})', [e2]);
            true;
        case TPath({name: 'String', pack: []}) if(field == "length"):
            e.def = EGoCode('utf8.RuneCountInString({0})', [e2]);
            t.def.addGoImport('unicode/utf8');
            true;
        case TAnonymous(fields):
            e.def = EGoCode('{0}[{1}]', [e2, {def: EConst(CString(field)), t: "Dynamic"}]);
            e.t = "Dynamic";
            true;
        case _:
            false;
    }

    if (transformed) {
        t.iterateExpr(e); // mikaib: e.parent or e?
    }

    return transformed;
}