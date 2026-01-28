package transformer.decls;

import HaxeExpr.HaxeFunction;
import haxe.macro.ComplexTypeTools;

function transformArray(t:Transformer, e: HaxeExpr, values: Array<HaxeExpr>) {
    final ct = HaxeExprTools.stringToComplexType(e.t);
    final pct = switch ct {
        case TPath(p):
            switch p.params[0] {
                case TPType(ct):
                    t.transformComplexType(ct);
                    ct;

                case _: null;
            }

        case _: ct;
    }

    e.def = EArrayDecl(values, pct);
}