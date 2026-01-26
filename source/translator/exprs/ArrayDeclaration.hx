package translator.exprs;

import translator.Translator;
import HaxeExpr;
import haxe.macro.Expr.ComplexType;

function translateArrayDeclaration(t:Translator, e: HaxeExpr, values:Array<HaxeExpr>, ct: ComplexType) {
    final ctStr = t.translateComplexType(ct);

    return '&[]${ctStr}{ ${values.map(e -> '${t.translateExpr(e)}').join(', ')} }';
} 