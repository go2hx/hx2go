package translator.exprs;

function translateEnumParameter(t:Translator, e:HaxeExpr, kind:String, index:Int) {
    return t.translateExpr(e) + ".Params[" + index + "]";
}