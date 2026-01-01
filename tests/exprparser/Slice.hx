package exprparser;

import parser.dump.ExprParser;
import sys.io.File;

function run() {
    final parser = new ExprParser("DEBUG");
    final lines = File.getContent(Util.normalizeCLRF("tests/exprparser/slice.txt")).split("\n");
    final expr = parser.parseObject(lines);
    // Function -> Block -> Return -> Call -> Field -> FStatic [1] -> objects need to be 2
    assert(expr
    .objects[0] // block
    .objects[0] // return
    .objects[0] // call
    .objects[0] // field
    .objects[1] // fstatic
    .objects.length, 2);
}