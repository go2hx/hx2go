package translator.exprs;

import translator.Translator;
import HaxeExpr;
import haxe.macro.Expr.ComplexType;

function translateCast(t:Translator, e:HaxeExpr, type:ComplexType) {
    // T(...)
    return t.translateComplexType(type) + '(' + t.translateExpr(e) + ')';
}
