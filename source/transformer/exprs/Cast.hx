package transformer.exprs;

import haxe.macro.Expr.ComplexType;
import HaxeExpr.HaxeVar;

function transformCast(t:Transformer, inner: HaxeExpr, e:HaxeExpr, type:ComplexType) {
    t.transformComplexType(type);
    t.iterateExpr(e);
}
