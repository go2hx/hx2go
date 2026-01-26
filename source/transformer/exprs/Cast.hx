package transformer.exprs;

import haxe.macro.Expr.ComplexType;
import HaxeExpr.HaxeVar;

final NON_CASTABLE_TYPES = [
    "go.ResultKind"
];

function transformCast(t:Transformer, inner: HaxeExpr, e:HaxeExpr, type:ComplexType) {
    switch type {
        case TPath(p):
            var fullName = '${p.pack.join(".")}${p.pack.length > 0 ? "." : ""}${p.name}';
            if (NON_CASTABLE_TYPES.contains(fullName)) {
                e.copyFrom(inner);
            }

        case _: null;
    }

    t.transformComplexType(type);
    t.iterateExpr(e);
}
