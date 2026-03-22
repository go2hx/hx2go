package transformer.exprs;

import haxe.macro.Expr.ComplexType;
import HaxeExpr.HaxeVar;
import haxe.macro.ComplexTypeTools;
import translator.TranslatorTools;
import translator.exprs.Function;

function transformCast(t:Transformer, e:HaxeExpr, inner: HaxeExpr, type:ComplexType) {
    switch type {
        case TPath({ pack: [], name: "String" }): {
            t.module.addGoImport('fmt');
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

    switch [from, to] {
        case [nF, TPath({ name: "Null", pack: [], params: [nT] })] if (!nF.match(TPath({ name: "Null", pack: [] }))):
            final ct = switch (nT) {
                case TPType(x): x;
                case _: null;
            }

            if (ct == null) {
                return;
            }

            t.transformComplexType(ct);

            e.def = EGoCode('struct{ Value ${t.module.translator.translateComplexType(ct)}; HasValue bool }{ {0}, true }', [inner]); // TODO: if type is nillable, we should check if it is.
            t.transformExpr(e);
            return;

        case [TPath({ name: "Null", pack: [], params: [nF] }), nT] if (!nT.match(TPath({ name: "Null", pack: [] }))):
            e.def = EGoCode('{0}.Value', [inner]);
            t.transformExpr(e);
            return;

        case [TFunction(fArgs, fRet), TFunction(tArgs, tRet)]: {
            var fromIsVoid = isVoid(fRet);
            var toIsVoid = isVoid(tRet);

            t.transformComplexType(fRet);
            t.transformComplexType(tRet);

            var params: Array<HaxeExpr> = [];
            for (i in 0...tArgs.length) {
                var fromArg = fArgs[i];
                var paramName = '_${i}';

                params.push({
                    t: null,
                    def: ECast({
                        t: null,
                        def: EConst(CIdent(paramName))
                    }, fromArg)
                });
            }

            for (arg in tArgs) {
                t.transformComplexType(arg);
            }

            for (arg in fArgs) {
                t.transformComplexType(arg);
            }

            var call: HaxeExpr = { t: null, def: ECall(inner, params) };
            if (!toIsVoid) {
                call.def = ECast(call.copy(), tRet);
            }

            var paramsForm = [for (i in 0...tArgs.length) '_${i} ${t.module.translator.translateComplexType(tArgs[i])}'].join(', ');
            var bodyForm = switch [fromIsVoid, toIsVoid] {
                case [false, false]: 'return {0}';
                case [false, true]: '_ = {0}';
                case [true, true]: '{0}';
                case [true, false]: Logging.transformer.error("illegal function cast from void to non-void!"); '#ERROR_ILLEGAL_CAST';
            }

            var retTypeForm = toIsVoid ? '' : ' ' + t.module.translator.translateComplexType(tRet);

            var funcForm = 'func($paramsForm)${retTypeForm} { $bodyForm }';
            e.def = EGoCode(funcForm, [ call ]);

            return;
        }

        case [TPath({ name: "Dynamic", pack: [] }), to] if (!to.match(TPath({ name: "Value", pack: ["go", "reflect"] }))): // if we desire a value, we shouldn't ensure the interface
            inner.def = t.createCallStatic("runtime.HxDynamic", "ensureInterface", [inner.copy()]);
            inner.flags = 0;
            t.transformExpr(inner);

        case _: null;
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
        if (meta.name == ":go.TypeAccess" || meta.name == ":coreType" || meta.name == ":go.NativeCast") {
            hasNative = true;
            break;
        }
    }

    if (fromTd.kind == toTd.kind && (fromTd.kind == TDClass || fromTd.kind.match(TDType(_)) || fromTd.kind.match(TDEnum(_))) && !hasNative) {
        e.def = EGoCode("(&{0})", [{ t: null, def: EField(inner.copy(), 'Hx_${modulePathToPrefix(toTd.name)}_Obj') }]);
    }
}
