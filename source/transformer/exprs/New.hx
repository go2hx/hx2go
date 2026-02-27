package transformer.exprs;

import HaxeExpr;
import transformer.Transformer;
import translator.TranslatorTools;
import haxe.macro.Expr.TypePath;
import haxe.macro.Expr.MetadataEntry;
import transformer.exprs.FieldAccess;

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
    e.def = ECall({
        t: e.t,
        def: EConst(CIdent('${className}_CreateInstance'))
    }, params);

    for (p in params) {
        t.transformExpr(p);
    }
}