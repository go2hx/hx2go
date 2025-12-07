package translator.exprs;

import translator.Translator;
import HaxeExpr;

function translateIf(t:Translator, econd:HaxeExpr, eif:HaxeExpr, eelse:HaxeExpr) {
    final s = "if " + t.translateExpr(econd) + " " + t.translateExpr(eif);
    if (eelse != null) {
        return s + " else " + t.translateExpr(eelse);
    }else{
        return s;
    }
}