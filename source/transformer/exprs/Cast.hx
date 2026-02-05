package transformer.exprs;

import haxe.macro.Expr.ComplexType;
import HaxeExpr.HaxeVar;
import haxe.macro.ComplexTypeTools;

function transformCast(t:Transformer, e:HaxeExpr, inner: HaxeExpr, type:ComplexType) {
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
        var superClass = fromTd.superClass;
        var target: ComplexType = TPath(toPath);
        var depth = 1;

        while (superClass != null) {
            if (superClass == ComplexTypeTools.toString(target)) {
                break;
            }

            final sct = HaxeExprTools.stringToComplexType(superClass);
            final spath = switch sct {
                case TPath(p): p;
                case _: null;
            }

            final smod = t.module.resolveClass(spath.pack, spath.name, t.module.path);
            superClass = smod.superClass;
            depth++;
        }

        if (superClass == null) {
            Logging.transformer.debug("Unable to process cast, it may be incorrect: " + inner.t + " -> " + e.t);
            return;
        }

        e.def = EField(inner.copy(), 'Super');
        for (idx in 0...depth - 1) {
            e.def = EField(e.copy(), 'Super');
        }
    }
}
