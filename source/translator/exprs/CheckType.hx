package translator.exprs;

import translator.Translator;
import HaxeExpr;
import haxe.macro.Expr.ComplexType;

function translateCheckType(t:Translator, e:HaxeExpr, ct:ComplexType) {
    //return t.translateExpr(e);
    return t.translateComplexType(ct) + "(" + t.translateExpr(e) + ")";
} 