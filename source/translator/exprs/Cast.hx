package translator.exprs;

using StringTools;

import translator.Translator;
import HaxeExpr;
import haxe.macro.Expr.ComplexType;

function translateCast(t:Translator, e:HaxeExpr, type:ComplexType) {
    final path = switch (type) {
        case TPath(x): x;
        case _: null;
    }

    var tStr = t.translateComplexType(type);
    var eStr = t.translateExpr(e);
    switch e.t {
        case "Dynamic": { 
            return '(' + eStr + '.(' + tStr + '))';
        }
        default:
    }
    
    return switch (tStr) {
        // pointer
        case _ if (path != null && tStr.charAt(0) == "*"): '((' + tStr + ')(' + eStr + '))';
        // array access
        case _ if (path != null && tStr.startsWith('[')): '((' + tStr + ')(' + eStr + '))';
        // no params type
        case _ if (path == null || (path.params == null || path.params.length == 0)): tStr + '(' + eStr + ')';
        // default case
        case _: '((' + tStr + ')(' + eStr + '))';
    };
}
