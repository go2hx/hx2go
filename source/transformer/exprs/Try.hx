package transformer.exprs;

import haxe.macro.Expr;

function transformTry(e:Expr, catches:Array<Catch>):Expr {
    return macro @:todo("try") null;
}