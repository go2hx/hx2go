package transformer.exprs;

import HaxeExpr.HaxeFunction;
import HaxeExpr.HaxeExprFlags;

function transformFunction(t:Transformer, f:HaxeFunction, name:String) {
    for (arg in f.args) {
        if (arg.value != null)
            t.iterateExpr(arg.value);
        switch arg.type {
            case TPath(p)  if (p.pack.length == 1 && p.pack[0] == name && f.params.filter(m -> m.name == p.name).length > 0):
                p.pack.resize(0);

            case _: t.transformComplexType(arg.type);
        }
    }

    t.iterateExpr(f.expr);
    t.transformComplexType(f.ret);
}