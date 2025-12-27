package exprparser;

import parser.dump.ExprParser;

function run() {
    final parser = new ExprParser("DEBUG");

    // Expr with Const followed by string, after semicolon
    final haxeExpr = parser.parse(["[Const:Array<T>] this;"]);
    switch haxeExpr.def {
        case EConst(CIdent(s)):
            equals(s, "this");
        default:
            equals("haxeExpr wrong def type: " + haxeExpr.def, "");
    }
    parser.reset();

    // Single Expr Object, followed by semicolon
    final obj = parser.parseObject(["[Return:Void];"]);
    equals(obj.objects.length, 0);
    equals(obj.def, "Return");
}