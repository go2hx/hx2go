package exprparser;
import parser.dump.ExprParser;
import sys.io.File;

function run() {
    final parser = new ExprParser("DEBUG");
    final lines = File.getContent(Util.normalizeCLRF("tests/exprparser/restKeyValueIterator.txt")).split("\n");
    final obj = parser.parseObject(lines);
    //parser.printObject(obj);
    parser.reset();
    final expr = parser.parse(lines);
    final ct = HaxeExprTools.stringToComplexType(expr.t);
    assert(ct == null, false);
}