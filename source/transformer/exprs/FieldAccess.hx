package transformer.exprs;

import HaxeExpr;
import transformer.Transformer;
import translator.TranslatorTools;

function transformFieldAccess(t:Transformer, e:HaxeExpr) {
    switch e.def {
        case EField(e2, field, kind):
            var isNative = resolveExpr(t, e2);
            field = isNative ? field : toPascalCase(field); // TODO: should use field's @:go.native
            e.def = EField(e2, field, kind);
        default:
    }
}

function resolveExpr(t:Transformer, e2:HaxeExpr): Bool {
    // TODO check go.native on $field
    final ct = HaxeExprTools.stringToComplexType(e2.t);
    var renamedIdent = "";
    var topLevel = false;
    var isNative = false;

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
                                    t.def.addGoImport(exprToString(meta.params[0]));
                                    isNative = true;
                                case ":go.native":
                                    // rename
                                    renamedIdent = exprToString(meta.params[0]);
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
}

function exprToString(e:haxe.macro.Expr):String {
    return switch e.expr {
        case EConst(CIdent(s)), EConst(CString(s)):
            s;
        default:
            throw "exprToString not implemented: " + e.expr;
    }
}
