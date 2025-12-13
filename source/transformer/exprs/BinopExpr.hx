package transformer.exprs;

import haxe.macro.Expr.Binop;

function transformBinop(t:Transformer, e:HaxeExpr, op:Binop, e1:HaxeExpr, e2:HaxeExpr) {
    t.iterateExpr(e);
}
