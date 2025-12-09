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
    return postFix ?
        (t.translateExpr(e) + printUnop(unop)) : // TODO: OpIncrement and OpDecrement are statements and not expressions in go, see example below.
        (printUnop(unop) + t.translateExpr(e)); // TODO: not a thing in go

        /*
            ALLOWED:
            x++
            return x;

            NOT ALLOWED:
            return x++;
        */
}

private function printUnop(op:Unop) {
    return switch (op) {
    	case OpIncrement: "++";
    	case OpDecrement: '--';
    	case OpNot: "!";
    	case OpNeg: "-";
    	case OpNegBits: "~";
    	case OpSpread: "...";
    }
}
