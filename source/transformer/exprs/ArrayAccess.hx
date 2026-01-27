package transformer.exprs;

import haxe.macro.Expr.ComplexType;
import HaxeExpr.HaxeVar;

function transformArrayAccess(t:Transformer, e: HaxeExpr, e1:HaxeExpr, e2:HaxeExpr) {
    final ct = HaxeExprTools.stringToComplexType(e1.t);
    switch (ct) {
        case TPath(p):
            switch [p.name, p.pack, p.params] {
                case ["Array", [], [TPType(_)]]:
                    e1.def = EGoCode("(*{0})", [e1.copy()]);

                case _:
            }

        case _:
    }

    t.iterateExpr(e);
}
