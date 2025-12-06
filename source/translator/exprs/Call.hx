package translator.exprs;

import HaxeExpr;
import translator.Translator;

function translateCall(t:Translator, e:HaxeExpr, params:Array<HaxeExpr>) {
    return (e.remapTo ?? t.translateExpr(e)) + "(" + params.map(param -> t.translateExpr(param)).join(", ") + ")";
}