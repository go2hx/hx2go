package translator.exprs;

import HaxeExpr.HaxeFunction;
import translator.Translator;
import translator.TranslatorTools;

function translateFunction(t:Translator, name:String, f:HaxeFunction) {
    final exprString = f.expr == null ? "{}" : t.translateExpr(f.expr);
    final paramString = if (f.params != null && f.params.length > 0) {
        // change out generic types to match with function
        normalizeGenericTypes(name, f);
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
// TODO
// Move to transformer
// Normalize all potential generic types inside of the function body as well
function normalizeGenericTypes(name:String, f:HaxeFunction) {
    for (i in 0...f.args.length) {
        switch f.args[i].type {
            case TPath(p):
                var isTypeParam = false;
                for (param in f.params) {
                    if (param.name == p.name && p.pack.length == 1 && p.pack[0] == toCamelCase(name)) {
                        isTypeParam = true;
                        break;
                    }
                }
                if (isTypeParam)
                    p.pack = [];
            default:
        }
    }
}