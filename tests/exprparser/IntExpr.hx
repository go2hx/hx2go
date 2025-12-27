package exprparser;

import parser.dump.ExprParser;
import sys.io.File;

function run() {
    final parser = new ExprParser("DEBUG");
    final lines = File.getContent("tests/exprparser/intExpr.txt").split("\n");
    final object = parser.parseObject(lines);
    equals(object.def, "Function");
    for (obj in object.objects) {
        trace("    " + obj.def);
    }
    equals(object.objects.length, 3);
    parser.reset();
    final haxeExpr = parser.parse(lines);
    equals(haxeExpr != null, true);
    equals(haxeExpr.def != null, true);
    switch haxeExpr.def {
        case EBlock(exprs):
            equals(exprs.length, 1);
            switch exprs[0].def {
                case EReturn(e):
                    switch e.def {
                        case EBinop(op, e1, e2):
                            switch op {
                                case OpSub:
                                default:
                                    equals("SUB", "NOT SUB");
                            }
                            
                        default:
                            equals("haxeExpr return wrong def type: " + haxeExpr.def, "");
                    }
                default:
                    equals("haxeExpr wrong def type: " + haxeExpr.def, "");
            }
        default:
            equals("haxeExpr wrong def type: " + haxeExpr.def, "");
    }
}