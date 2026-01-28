package translator.exprs;

import haxe.macro.Expr.ComplexType;
import HaxeExpr.HaxeObjectField;

function translateObjectDeclaration(t:Translator, fields:Array<HaxeObjectField>):String {
    return "struct{" + fields.map(f -> f.field + " " + t.translateComplexType(f.t)).join("; ") + "}{" + 
        fields.map(f -> f.field + ": " + t.translateExpr(f.expr)).join(", ") + 
    "}";
}
