package translator.exprs;

import translator.Translator;
import HaxeExpr;

function translateThrow(t:Translator, e:HaxeExpr) {
    return 'panic(' + t.translateExpr(e) + ')';
} 