package exprparser;

import parser.dump.ExprParser;
import sys.io.File;

function run() {
    final parser = new ExprParser("DEBUG");
    final lines = File.getContent(Util.normalizeCLRF("tests/exprparser/intExpr.txt")).split("\n");
    final object = parser.parseObject(lines);
    assert(object.def, "Function");
    for (obj in object.objects) {
        trace("    " + obj.def);
    }
    assert(object.objects.length, 3);
    parser.reset();
    final haxeExpr = parser.parse(lines);
    assert(haxeExpr != null, true);
    assert(haxeExpr.def != null, true);
    switch haxeExpr.def {
        case EBlock(exprs):
            assert(exprs.length, 1);
            switch exprs[0].def {
                case EReturn(e):
                    switch e.def {
                        case EBinop(op, e1, e2):
                            switch op {
                                case OpSub:
                                default:
                                    assert("SUB", "NOT SUB");
                            }
                            
                        default:
                            assert("haxeExpr return wrong def type: " + haxeExpr.def, "");
                    }
                default:
                    assert("haxeExpr wrong def type: " + haxeExpr.def, "");
            }
        default:
            assert("haxeExpr wrong def type: " + haxeExpr.def, "");
    }
}