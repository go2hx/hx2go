package transformer.exprs;

import haxe.macro.Expr.Binop;

function transformBinop(t:Transformer, e:HaxeExpr, op:Binop, e1:HaxeExpr, e2:HaxeExpr) {
    if (e.t == null)
        return;
    switch op {
        // Do not do a type conversion transform if assign, on lhs
        case OpAssignOp(_):
        case OpAssign:
        default:
            t.transformTypeConversion(e.t, e1);
    }
    t.transformTypeConversion(e.t, e2);
    t.iterateExpr(e);
}