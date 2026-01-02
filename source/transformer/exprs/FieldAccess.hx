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

            var isNative = resolveExpr(t, e2);
            field = isNative ? field : toPascalCase(field); // TODO: should use field's @:go.native
            e.def = EField(e2, field, kind);
        default:
    }
}

function resolveExpr(t:Transformer, e2:HaxeExpr): Bool {
    // TODO: check go.native on $field
    if (e2.t == null) {
        trace('null e2.t');
        return false;
    }

    try {
        final ct = HaxeExprTools.stringToComplexType(e2.t);
        var renamedIdent = "";
        var topLevel = false;
        var isNative = false;

        if (ct == null)
            return false;
        switch ct {
            case TPath(p):
                if (p.name == "Class" && p.pack.length == 0)
                    switch p.params[0] {
                        case TPType(TPath(p)):
                            final td = t.module.resolveClass(p.pack, p.name);
                            if (td != null) {
                                for (meta in td.meta()) {
                                    switch meta.name {
                                    case ":go.package":
                                        // import
                                        t.def.addGoImport(t.exprToString(meta.params[0]));
                                        isNative = true;
                                    case ":go.native":
                                        // rename
                                        renamedIdent = t.exprToString(meta.params[0]);
                                        isNative = true;
                                    case ":go.toplevel":
                                        // used for T() calls, removes "$a." in "$a.$b"
                                        renamedIdent = "";
                                        topLevel = true;
                                        isNative = true;
                                    }
                                }
                            }
                        default:
                    }
            default:
        }

        if (renamedIdent != "" || topLevel)
            e2.remapTo = renamedIdent;

        return isNative; // TODO: check if class is extern
    } catch (e) {
        trace('parsing type failed', e);
        return false;
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
