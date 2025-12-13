package translator.exprs;

using StringTools;

import haxe.macro.Expr.ComplexType;
import haxe.macro.ComplexTypeTools;
import translator.Translator;
import HaxeExpr;

function translateGoSliceConstruct(t:Translator, ct:ComplexType) {
    return ComplexTypeTools.toString(ct) + "{}";
}
