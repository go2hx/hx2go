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

            var keepName = resolveExpr(t, e2, field);
            if (!keepName) {
                field = toPascalCase(field);
            }

            e.def = EField(e2, field, kind);
            t.transformExpr(e2); // handle recursive field accesses
        default:
    }
}

function resolveExpr(t:Transformer, e2:HaxeExpr, fieldName:String):Bool {
    if (e2.t == null) {
        trace('null e2.t');
        return false;
    }

    try {
        final ct = HaxeExprTools.stringToComplexType(e2.t);
        if (ct == null) {
            return false;
        }

        return processComplexType(t, e2, ct);
    } catch (e) {
        trace('parsing type failed', e);
        return false;
    }
}

function processComplexType(t:Transformer, e2:HaxeExpr, ct:ComplexType):Bool {
    var path = switch ct {
        case TPath(p): p;
        case _: return false;
    }

    if (path.name != "Class" || path.pack.length != 0) {
        return false;
    }

    var innerPath = switch path.params[0] {
        case TPType(TPath(p)): p;
        case _: return false;
    }

    final td = t.module.resolveClass(innerPath.pack, innerPath.name);
    if (td == null) {
        return false;
    }

    var renamedIdentLeft = t.module.toGoPath(td.module).join(".");
    var isNative = false;
    var topLevel = false;
    var transformName = false;

    for (meta in td.meta()) {
        if (meta.name == ":go.TypeAccess") {
            var result = processStructAccessMeta(t, meta, renamedIdentLeft);
            renamedIdentLeft = result.name;
            isNative = result.isNative;
            topLevel = result.topLevel;
            transformName = result.transformName;
        }
    }

    // this will handle the case if a class tries to call something on itself: it will remove the package path
    if (!isNative && t.module.path == innerPath.pack.concat([innerPath.name]).join(".")) {
        renamedIdentLeft = "";
        topLevel = true;
    }

    if (renamedIdentLeft != "" || topLevel) {
        e2.remapTo = renamedIdentLeft;
    }

    return isNative && !transformName;
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
    var e2Name = switch e2.def {
        case EConst(CIdent(x)): x;
        case _: return false;
    }

    if (e.parent?.def == null) {
        return false;
    }

    if (e?.special != null) {
        final tstr = switch (e.special) {
            case FInstance(x): x;
            case FStatic(x, _): x;
            case _: null;
        }

        final ct = HaxeExprTools.stringToComplexType(tstr);
        final fieldHandled = switch ct {
            case TPath(p): handleFieldTransform(t, e, p, e2Name, field);
            case _: false;
        }

        if (fieldHandled) {
            return true;
        }
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
        t.iterateExpr(e.parent);
    }

    return transformed;
}

function handleFieldTransform(t:Transformer, e:HaxeExpr, p:TypePath, e2Name:String, field:String):Bool {
    var transformed = switch [p.name, p.pack, p.params, field] {
        case ['Array', [], _, 'length']:
            e.def = EGoCode('int32(len(*${e2Name}))', []);
            true;

        case _:
            false;
    }

    if (transformed) {
        t.iterateExpr(e.parent);
    }

    return transformed;
}