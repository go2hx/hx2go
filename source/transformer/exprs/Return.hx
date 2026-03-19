package transformer.exprs;

import HaxeExpr;
import haxe.macro.ComplexTypeTools;

function transformReturn(t:Transformer, expr: HaxeExpr, e:HaxeExpr) {
    if (e?.t == null) {
        t.iterateExpr(expr);
        return;
    }

    var want = t.getCurrentReturnType();
    var have = HaxeExprTools.stringToComplexType(e.t);

    if (!HaxeExprTools.compareType(have, want)) {
        e.def = ECast(e.copy(), want);
        e.t = ComplexTypeTools.toString(want);
    }

    t.iterateExpr(expr);
}
