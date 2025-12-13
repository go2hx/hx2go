package translator.exprs;

import translator.Translator;
import HaxeExpr;
import haxe.macro.Expr.ComplexType;

function translateCast(t:Translator, e:HaxeExpr, type:ComplexType) {
    final path = switch (type) {
        case TPath(x): x;
        case _: null;
    }

    if (path == null || path.params.length == 0) {
        return t.translateComplexType(type) + '(' + t.translateExpr(e) + ')';
    }

    return '((' + t.translateComplexType(type) + ')' + t.translateExpr(e) + ')';
}
