package transformer.decls;

import HaxeExpr.HaxeFunction;
import translator.TranslatorTools;

function transformFunction(t:Transformer, name:String, f:HaxeFunction) {
    for (arg in f.args) {
        t.transformComplexType(arg.type);
    }
}