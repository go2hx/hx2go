package translator.exprs;

import haxe.macro.Expr.Binop;
import translator.Translator;
import HaxeExpr;

function translateBinop(t:Translator, op:Binop, e1:HaxeExpr, e2:HaxeExpr) {
    return t.translateExpr(e1) + ' ' + printBinop(op) + ' ' + t.translateExpr(e2); // the spaces are very important, perhaps we should wrap them in parenthesis?
}

private function printBinop(op:Binop) {
    return switch (op) {
        case OpAdd: "+";
        case OpMult: "*";
        case OpDiv: "/";
        case OpSub: "-";
        case OpAssign: "=";
        case OpEq: "==";
        case OpNotEq: "!=";
        case OpGt: ">";
        case OpGte: ">=";
        case OpLt: "<";
        case OpLte: "<=";
        case OpAnd: "&";
        case OpOr: "|";
        case OpXor: "^";
        case OpBoolAnd: "&&";
        case OpBoolOr: "||";
        case OpShl: "<<";
        case OpShr: ">>";
        case OpUShr: ">>"; // in go, it depends on the type if it's signed or unsigned shift
        case OpMod: "%";
        case OpInterval: Logging.translator.error("unsupported binop kind: " + op); "..."; // TODO: impl
        case OpArrow: Logging.translator.error("unsupported binop kind: " + op); "=>"; // TODO: impl
        case OpIn: Logging.translator.error("unsupported binop kind: " + op); "in"; // TODO: impl
        case OpNullCoal: Logging.translator.error("unsupported binop kind: " + op); "??"; // TODO: impl
        case OpAssignOp(op):
            printBinop(op) + "=";
    }
}
