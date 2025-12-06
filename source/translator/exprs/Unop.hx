package translator.exprs;

import haxe.macro.Expr.Unop;
import translator.Translator;
import HaxeExpr;

/**
    An unary operator `op` on `e`:

    - `e++` (`op = OpIncrement, postFix = true`)
    - `e--` (`op = OpDecrement, postFix = true`)
    - `++e` (`op = OpIncrement, postFix = false`)
    - `--e` (`op = OpDecrement, postFix = false`)
    - `-e` (`op = OpNeg, postFix = false`)
    - `!e` (`op = OpNot, postFix = false`)
    - `~e` (`op = OpNegBits, postFix = false`)
**/
function translateUnop(t:Translator, unop:Unop, postFix:Bool, e:HaxeExpr) {

}