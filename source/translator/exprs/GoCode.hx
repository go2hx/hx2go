package translator.exprs;

using StringTools;

import translator.Translator;
import HaxeExpr;

function translateGoCode(t:Translator, format:String, args: Array<HaxeExpr>) {
    for (i in 0...args.length) {
        var p = args[i];
        format = format.replace('{$i}', t.translateExpr(p));
    }

    return format;
}
