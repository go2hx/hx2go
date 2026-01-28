package translator.exprs;

import haxe.macro.Expr.ComplexType;
import HaxeExpr.HaxeFunction;
import translator.Translator;
import translator.TranslatorTools;

function translateFunction(t:Translator, name:String, f:HaxeFunction) {
    final exprString = f.expr == null ? "{}" : t.translateExpr(f.expr);
    final retString = f.ret == null ? "" : t.translateComplexType(f.ret) + " ";
    final paramString = if (f.params != null && f.params.length > 0) {
        // string
        "[" +
        f.params.map(p -> p.name + " any").join(",") +
        "]";
    }else{
        "";
    }

    final args = f.args.map(arg -> arg.name + " " + t.translateComplexType(arg.type));
    final ret = f.ret == null || isVoid(f.ret) ? "" : t.translateComplexType(f.ret);
    return 'func $name$paramString(${args.join(", ")}) $ret $exprString\n';
}

function isVoid(ct:ComplexType) {
    return switch ct {
        case TPath({pack: [], name: "Void"}):
            true;
        default:
            false;
    }
}