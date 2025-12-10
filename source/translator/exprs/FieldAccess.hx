package translator.exprs;

import haxe.macro.Expr.EFieldKind;
import haxe.macro.Expr.Binop;
import HaxeExpr;

function translateFieldAccess(t:Translator, e:HaxeExpr, field:String, kind:EFieldKind) {
    // TODO implement kind Safe
    var fieldOn = e.remapTo ?? t.translateExpr(e);
    return fieldOn + (fieldOn != "" ? '.' : '') + '$field';
}
