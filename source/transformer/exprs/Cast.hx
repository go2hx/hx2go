package transformer.exprs;

import haxe.macro.Expr.ComplexType;
import HaxeExpr.HaxeVar;
import haxe.macro.ComplexTypeTools;
import translator.TranslatorTools;

function transformCast(t:Transformer, e:HaxeExpr, inner: HaxeExpr, type:ComplexType) {
    switch type {
        case TPath({ pack: [], name: "String" }): {
            e.def = EGoCode("fmt.Sprint({0})", [inner.copy()]);
        }
        default:
    }

    t.transformComplexType(type);
    t.iterateExpr(e);

    if (inner.t == null || e.t == null) {
        Logging.transformer.debug("Unable to process cast, it may be incorrect (internal null): " + inner?.t + " -> " + e?.t);
        return;
    }

    final from = HaxeExprTools.stringToComplexType(inner.t);
    if (from == null) {
        Logging.transformer.debug("Unable to process cast, it may be incorrect: " + inner.t + " -> " + e.t);
        return;
    }

    final to = HaxeExprTools.stringToComplexType(e.t); // yes, you are correct, this is questionable. also yes, you should ignore this...
    if (to == null) {
        Logging.transformer.debug("Unable to process cast, it may be incorrect: " + inner.t + " -> " + e.t);
        return;
    }

    final fromPath = switch from {
        case TPath({ pack: [], name: "Null", params: [TPType(TPath(p))] }): p;
        case TPath(p): p;
        case _: null;
    }

    final toPath = switch to {
        case TPath({ pack: [], name: "Null", params: [TPType(TPath(p))] }): p;
        case TPath(p): p;
        case _: null;
    }

    if (fromPath == null || toPath == null) {
        return;
    }

    final fromTd = t.module.resolveClass(fromPath.pack, fromPath.name, t.module.path);
    final toTd = t.module.resolveClass(toPath.pack, toPath.name, t.module.path);
    if (fromTd == null || toTd == null) {
        Logging.transformer.debug("Unable to process cast, it may be incorrect: " + inner.t + " -> " + e.t);
        return;
    }

    var hasNative = fromTd.isExtern || toTd.isExtern;
    for (meta in fromTd.meta().concat(toTd.meta())) {
        if (meta.name == ":go.TypeAccess" || meta.name == ":coreType") {
            hasNative = true;
            break;
        }
    }

    if (fromTd.kind == toTd.kind && fromTd.kind == TDClass && !hasNative) {
        e.def = EGoCode("(&{0})", [{ t: null, def: EField(inner.copy(), 'Hx_${modulePathToPrefix(toTd.name)}_Obj') }]);
    }
}
