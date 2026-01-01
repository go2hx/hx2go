package exprparser;

import parser.dump.ExprParser;
import sys.io.File;

function run() {
    final parser = new ExprParser("DEBUG");
    final lines = Util.normalizeCLRF(File.getContent("tests/exprparser/cf_flags.txt")).split("\n");
    final object = parser.parseObject(lines);
    // check to make sure that cf_flags is not caught at the end
    assert(object.objects.length, 1);
    assert(object.objects[0].objects.length, 1);
    parser.printObject(object);
}