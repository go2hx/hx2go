package translator.exprs;

import translator.Translator;
import HaxeExpr;

function translateUntyped(t:Translator, e:HaxeExpr) {
    return t.translateExpr(e);
}
