package translator.exprs;

import translator.Translator;
import HaxeExpr;

function translateIf(t:Translator, econd:HaxeExpr, eif:HaxeExpr, eelse:HaxeExpr) {
    final s = "if " + t.translateExpr(econd) + " " + t.translateExpr(translateToBlock(eif));
    if (eelse != null) {
        return s + " else " + t.translateExpr(translateToBlock(eelse));
    }else{
        return s;
    }
}

private function translateToBlock(expr:HaxeExpr):HaxeExpr {
    if (expr.def == null)
        return expr;
    switch expr.def {
        case EIf(_, _, _):
        case EBlock(_):
        default:
            return {
                t: expr.t,
                specialDef: null,
                def: EBlock([expr]),
                remapTo: expr.remapTo,
            };
    }
    return expr;
}