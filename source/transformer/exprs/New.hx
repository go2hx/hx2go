package transformer.exprs;

import haxe.macro.Expr.TypeParam;
import haxe.macro.Expr.ComplexType;
import HaxeExpr;
import transformer.Transformer;
import translator.TranslatorTools;
import haxe.macro.Expr.TypePath;
import haxe.macro.Expr.MetadataEntry;
import transformer.exprs.FieldAccess;
import haxe.macro.Expr.TypeParam.TPType;

function transformNew(t:Transformer, e:HaxeExpr, tpath: TypePath, params: Array<HaxeExpr>) {
    final td = t.module.resolveClass(tpath.pack, tpath.name, t.module.path);
    if (td == null) {
        Logging.transformer.warn('null td for ENew(...)');
        return;
    }

    var structInit = false;
    var isNative = false;
    var transformName = false;
    var name = ''; // TODO: default name
    var setParams:Array<TypeParam> = [];

    switch tpath {
        case { pack: [], name: "Array", params: [TPType(ct)] }:
            e.def = EArrayDecl([], ct);
            t.transformComplexType(ct);
            return;
        case { pack: [], name: "String"}:
            e.def = params[0].def;
            return;
        case {pack: _, name: _, params: params} if (params != null && params.length > 0):
            setParams = params;
        case _: null;
    }

    for (m in td.meta()) {
        switch m.name {
            case ':structInit':
                structInit = true;

            case ':go.TypeAccess':
                var res = processStructAccessMeta(t, m, name);
                isNative = res.isNative;
                transformName = res.transformName;
                name = res.name;

            case _: null;
        }
    }

    if (isNative && structInit) {
        if (td.constructor == null) {
            Logging.transformer.error('td.constructor may not be null');
            return;
        }

        final args = switch td.constructor.expr.def {
            case EFunction(_, f): f.args;
            case _: null;
        };

        if (args == null) {
            Logging.transformer.error('td.constructor args may not be null');
            return;
        }

        var count = 0;
        if (name.charAt(0) == "*") {
            name = "&" + name.substr(1);
        }

        e.def = EGoCode('${name}{ ${args.map(a -> '${transformName ? toPascalCase(a.name) : a.name}: {${count++}}').join(', ')} }', params);
    }

    var className = 'Hx_${modulePathToPrefix(td.name)}_Obj';

    for (param in setParams) {
        switch param {
            case TPType(param):
                t.transformComplexType(param);
            default:
        }
    }

    e.def = ECall({
        t: e.t,
        def: EConst(CIdent('${className}_CreateInstance' + t.module.translator.translateComplexTypeParams(setParams)))
    }, params);

    for (p in params) {
        t.transformExpr(p);
    }
}