package translator.exprs;

using StringTools;

import haxe.macro.Expr.ComplexType;
import haxe.macro.ComplexTypeTools;
import translator.Translator;
import HaxeExpr;

function translateGoSliceOp(t:Translator, on:HaxeExpr, from:HaxeExpr, to:Null<HaxeExpr>) {
    return t.translateExpr(on) + '[' + t.translateExpr(from) + ':' + (to != null ? t.translateExpr(to) : '') + ']';
}
