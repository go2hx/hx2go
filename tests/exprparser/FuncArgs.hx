package exprparser;

import parser.dump.ExprParser;
import sys.io.File;


function run() {
    final parser = new ExprParser("DEBUG");
    final haxeExpr = parser.parse(Util.normalizeCLRF(File.getContent("tests/exprparser/funcArgs.txt")).split("\n"));
    assert(haxeExpr != null, true);
    assert(haxeExpr.def != null, true);
    switch haxeExpr.def {
        case EBlock(exprs):
            assert(exprs.length, 0);
        default:
            assert("haxeExpr wrong def type: " + haxeExpr.def, "");
    }
}