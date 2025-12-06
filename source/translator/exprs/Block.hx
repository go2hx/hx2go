package translator.exprs;

import HaxeExpr;

function translateBlock(t:Translator, exprs:Array<HaxeExpr>) {
    return "{\n" + exprs.map(e -> "    " + t.translateExpr(e)).join("\n") + "\n}";
}