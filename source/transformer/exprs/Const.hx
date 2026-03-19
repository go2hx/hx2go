package transformer.exprs;

import haxe.macro.Expr.ComplexType;
import haxe.macro.Expr.Constant;

function transformConst(t:Transformer, e:HaxeExpr) {
    if (e?.t == null) {
        return;
    }

    final ct = HaxeExprTools.stringToComplexType(e.t);

    switch [e.def, ct] {
        case [EConst(CIdent("null")), TPath({ name: "Null", pack: [], params: [nT] })]:
            final p = switch (nT) {
                case TPType(x): x;
                case _: null;
            }

            if (p == null) {
                return;
            }

            t.transformComplexType(p);
            e.def = EGoCode('struct{ Value ${t.module.translator.translateComplexType(p)}; HasValue bool }{}', []);

        case [EConst(CIdent("null")), _]:
            e.def = EConst(CIdent("nil"));

        default:
    }
}
