package translator.exprs;

import translator.Translator;
import HaxeExpr;
/**
    Represents a `while` expression.

    When `normalWhile` is `true` it is `while (...)`.

    When `normalWhile` is `false` it is `do {...} while (...)`.
**/
function translateWhile(t:Translator, econd:HaxeExpr, e:HaxeExpr, normalWhile:Bool) {
    return "for" + (econd?.def == null ? '' : ' ${t.translateExpr(econd)}') + " " + t.translateExpr(e);
}
