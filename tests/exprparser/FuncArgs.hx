package exprparser;

import parser.dump.ExprParser;
import sys.io.File;


function run() {
    final parser = new ExprParser("DEBUG");
    final haxeExpr = parser.parse(File.getContent("tests/exprparser/funcArgs.txt").split("\n"));
    equals(haxeExpr != null, true);
    equals(haxeExpr.def != null, true);
    switch haxeExpr.def {
        case EBlock(exprs):
            equals(exprs.length, 0);
        default:
            equals("haxeExpr wrong def type: " + haxeExpr.def, "");
    }
}