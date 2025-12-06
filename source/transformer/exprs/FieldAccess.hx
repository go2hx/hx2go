package transformer.exprs;

import HaxeExpr;
import transformer.Transformer;

function transformFieldAccess(t:Transformer, e:HaxeExpr) {
    switch e.def {
        case EField(e2, field, kind):
            resolveExpr(t, e2);
            field = field.charAt(0).toUpperCase() + field.substr(1);
            e.def = EField(e2, field, kind);
        default:
    }
}

function resolveExpr(t:Transformer, e2:HaxeExpr) {
    // TODO check go.native on $field
    final ct = HaxeExprTools.stringToComplexType(e2.t);
    var renamedIdent = "";
    switch ct {
        case TPath(p):
            if (p.name == "Class" && p.pack.length == 0)
                switch p.params[0] {
                    case TPType(TPath(p)):
                        final td = t.module.resolveClass(p.pack, p.name);
                        for (meta in td.meta()) {
                            switch meta.name {
                            case ":go.package":
                                // import
                                t.def.addGoImport(exprToString(meta.params[0]));
                            case ":go.native":
                                // rename
                                renamedIdent = exprToString(meta.params[0]);
                            }
                        }
                    default:
                }
        default:
    }
    if (renamedIdent != "")
        e2.remapTo = renamedIdent;
}

function exprToString(e:haxe.macro.Expr):String {
    return switch e.expr {
        case EConst(CIdent(s)), EConst(CString(s)):
            s;
        default:
            throw "exprToString not implemented: " + e.expr;
    }
}