package transformer.decls;

import HaxeExpr.HaxeFunction;
import translator.TranslatorTools;

function transformFunction(t:Transformer, name:String, f:HaxeFunction) {
    for (arg in f.args) {
        switch (arg.type) {
            case TPath(p)  if (p.pack.length == 1 && p.pack[0] == name && f.params.filter(m -> m.name == p.name).length > 0):
                p.pack.resize(0);

            case _: t.transformComplexType(arg.type);
        }
    }

    if (f.ret != null) {
        t.transformComplexType(f.ret);
    }
}