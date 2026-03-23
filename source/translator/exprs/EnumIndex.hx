package translator.exprs;

function translateEnumIndex(t:Translator, e:HaxeExpr) {
    return t.translateExpr(e) + ".Constructor.Index";
}