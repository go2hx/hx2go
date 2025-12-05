package translator.exprs;

import haxe.macro.Expr;

function translateCall(e:Expr, params:Array<Expr>) {
    return "_ = true\n";
}