package translator.exprs;

import translator.Translator;
import HaxeExpr;

function translateArrayAccess(t:Translator, e1:HaxeExpr, e2:HaxeExpr) {
    return t.translateExpr(e1) + "[" + t.translateExpr(e2) + "]";
}