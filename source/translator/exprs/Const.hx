package translator.exprs;

import translator.Translator;
import HaxeExpr;
import haxe.macro.Expr.Constant as MacroExprConstant;

function translateConst(t:Translator, c:MacroExprConstant) {
    return switch c {
        case CIdent(s):
            s;
        case CString(s, kind):
            // TODO prevent escaping
            '"$s"';
        case CInt(v, s):
            v;
        case CFloat(f, s):
            f;
        case CRegexp(r, opt):
            throw "CRegexp translateConst not implemented";
    }
}