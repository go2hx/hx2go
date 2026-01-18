package transformer.exprs;

using StringTools;

import haxe.macro.Expr.EFieldKind;
import HaxeExpr;
import transformer.Transformer;
import translator.Translator;
import translator.TranslatorTools;
import haxe.macro.ComplexTypeTools;

function transformFieldAccess(t:Transformer, e:HaxeExpr) {
    switch e.def {
        case EField(e2, field, kind):
            if (resolvePkgTransform(t, e, e2, field, kind)) {
                return;
            }

            var res = resolveExpr(t, e2, field);
            if (res.isNative && res.field != null) {
                for (m in res.field.meta) {
                    switch m.name {
                        case ":go.native":
                            field = t.exprToString(m.params[0]);
                        case _:
                            null;
                    }
                }
            } else {
                field = toPascalCase(field);
            }

            e.def = EField(e2, field, kind);
        default:
    }
}

function resolveExpr(t:Transformer, e2:HaxeExpr, fieldName: String): { isNative: Bool, field: HaxeField } {
    // TODO: check go.native on $field
    if (e2.t == null) {
        trace('null e2.t');
        return { isNative: false, field: null };
    }

    try {
        final ct = HaxeExprTools.stringToComplexType(e2.t);
        var renamedIdentLeft = "";
        var access: Null<HaxeField> = null;
        var topLevel = false;
        var isNative = false;
        if (ct == null)
            return { isNative: false, field: null };
        switch ct {
            case TPath(p):
                if (p.name == "Class" && p.pack.length == 0)
                    switch p.params[0] {
                        case TPType(TPath(p)):
                            final td = t.module.resolveClass(p.pack, p.name);
                            renamedIdentLeft = t.module.toGoPath(td.module).join(".");
                            if (td != null) {
                                for (meta in td.meta()) {
                                    switch meta.name {
                                    case ":go.package":
                                        // import
                                        t.def.addGoImport(t.exprToString(meta.params[0]));
                                        isNative = true;
                                    case ":go.native":
                                        // rename
                                        renamedIdentLeft = t.exprToString(meta.params[0]);
                                        isNative = true;
                                    case ":go.toplevel":
                                        // used for T() calls, removes "$a." in "$a.$b"
                                        renamedIdentLeft = "";
                                        topLevel = true;
                                        isNative = true;
                                    }
                                }
                            }

                            for (field in td.fields) {
                                if (fieldName == field.name) {
                                    access = field;
                                    break;
                                }
                            }

                        default:
                    }
            default:
        }

        if (renamedIdentLeft != "" || topLevel)
            e2.remapTo = renamedIdentLeft;

        return { isNative: isNative, field: access }; // TODO: check if class is extern
    } catch (e) {
        trace('parsing type failed', e);
        return { isNative: false, field: null };
    }
}

function resolvePkgTransform(t:Transformer, e:HaxeExpr, e2:HaxeExpr, field: String, kind: EFieldKind): Bool {
    var e2Name = switch (e2.def) {
        case EConst(CIdent(x)): x;
        case _: null;
    }

    if (e2Name == null) {
        return false;
    }

    return switch (e.parent.def) {
        case ECall(e, params):
            var res = switch [e2Name, field] {
                case ['go.Syntax', 'code']:
                    e.parent.def = EGoCode(
                        t.exprToString(params.shift()),
                        params
                    );
                    true;

                case ['go._Slice.Slice_Impl_', '_create']:
                    final ct = HaxeExprTools.stringToComplexType(e.parent.t);
                    t.transformComplexType(ct);
                    e.parent.def = EGoSliceConstruct(ct);
                    true;

                case _: false;
            }

            if (res) {
                t.iterateExpr(e.parent);
            }

            res;
        case _: false;
    }
}
