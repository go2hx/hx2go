package exprparser;

import parser.dump.ExprParser;
import sys.io.File;

function run() {
    final parser = new ExprParser("DEBUG");
    final lines = File.getContent(Util.normalizeCLRF("tests/exprparser/treeNode.txt")).split("\n");
    final object = parser.parseObject(lines);
    final object = object.objects.pop();
    assert(object.def, "Block");
    assert(object.objects[0].def, "If");
    assert(object.objects[0].objects[1].def, "Then");
    assert(object.objects[0].objects[1].objects[0].def, "Block");
    parser.reset();
    parser.parse(lines);
}