package translator.exprs;

import HaxeExpr.HaxeFunction;
import translator.Translator;
import translator.TranslatorTools;

function translateFunction(t:Translator, name:String, f:HaxeFunction) {
    final exprString = f.expr == null ? "{}" : t.translateExpr(f.expr);
    final paramString = if (f.params != null && f.params.length > 0) {
        // string
        "[" +
        f.params.map(p -> p.name + " any").join(",") +
        "]";
    }else{
        "";
    }
    final args = f.args.map(arg -> arg.name + " " + t.translateComplexType(arg.type));
    return 'func $name$paramString(${args.join(", ")}) $exprString\n';
}