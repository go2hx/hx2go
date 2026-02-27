package transformer.exprs;

import haxe.macro.Expr.Unop;
import haxe.macro.Expr.Binop;
import transformer.exprs.BinopExpr;

function transformUnop(t:Transformer, e:HaxeExpr, op:Unop, postFix:Bool, inner:HaxeExpr) {
    if (inner.t == "Dynamic") {
        var isAssign = false;
        var funcName = switch op {
            case OpIncrement: isAssign = true; "increment"; // preprocessor ensures its never used as expr or prefix, we can safely assume its always an assign.
            case OpDecrement: isAssign = true; "decrement"; // preprocessor ensures its never used as expr or prefix, we can safely assume its always an assign.
            case OpNeg: "negate";
            case OpNot: "not";
            case OpNegBits: "bitnot";
            case OpSpread: Logging.transformer.error('unhandled dynamic unop (transformUnop)'); "#ERROR";
        }

        var dyn = makeHxDynamicCall(funcName, [inner]);
        e.def = isAssign ? EBinop(OpAssign, inner, { t: null, def: dyn }) : dyn;

        t.transformExpr(e);

        return;
    }

    t.iterateExpr(e);
}
