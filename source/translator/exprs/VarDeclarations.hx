package translator.exprs;

import translator.Translator;
import HaxeExpr;
/**
    Variable declarations.
**/
function translateVarsDeclarations(t:Translator, vars:Array<HaxeVar>) {
    return vars.map(v -> {
        "var " + v.name +
        // type info
        (v.type == null ? "" : " " + t.translateComplexType(v.type)) + // TODO: support TNamed(...)
        (v.expr != null ? " = " + t.translateExpr(v.expr) : "") +
         "; _ = " + v.name;
    }).join("\n");
}
