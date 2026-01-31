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
    return if (true) t.translateExpr(e) + printUnop(unop)
	else printUnop(unop) + t.translateExpr(e);
}

private function printUnop(op:Unop) {
    return switch (op) {
    	case OpIncrement: "++";
    	case OpDecrement: '--';
    	case OpNot: "!";
    	case OpNeg: "-";
    	case OpNegBits: "^"; // go uses "^" for bitwise negation (see: https://go.dev/ref/spec#Operators), while haxe uses "~" (see: https://api.haxe.org/haxe/macro/Unop.html#OpNegBits)
    	case OpSpread: "...";
    }
}
