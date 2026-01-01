package exprparser;

import parser.dump.ExprParser;

function run() {
    final parser = new ExprParser("DEBUG");

    // Expr with Const followed by string, after semicolon
    final haxeExpr = parser.parse(["[Const:Array<T>] this;"]);
    switch haxeExpr.def {
        case EConst(CIdent(s)):
            assert(s, "this");
        default:
            assert("haxeExpr wrong def type: " + haxeExpr.def, "");
    }
    parser.reset();

    // Single Expr Object, followed by semicolon
    final obj = parser.parseObject(["[Return:Void];"]);
    assert(obj.objects.length, 0);
    assert(obj.def, "Return");
}