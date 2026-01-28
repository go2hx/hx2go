package exprparser;
import parser.dump.ExprParser;
import sys.io.File;

function run() {
    final parser = new ExprParser("DEBUG");
    final lines = File.getContent(Util.normalizeCLRF("tests/exprparser/restKeyValueIterator2.txt")).split("\n");
    final obj = parser.parseObject(lines);
    parser.printObject(obj);
    parser.reset();
    final expr = parser.parse(lines);
    switch expr.def {
        case EFunction(kind, f):
            switch f.expr.def {
                case EBlock(exprs):
                    assert(exprs.length, 1);
                    switch exprs[0].def {
                        case EObjectDecl(_):
                            final ct = HaxeExprTools.stringToComplexType(exprs[0].t);
                            assert(ct == null, false);
                        default:
                            assert("haxeExpr wrong def type: " + exprs[0].def, "");
                    }
                default:
                    assert("haxeExpr wrong def type: " + f.expr.def, "");
            }
        default:
            assert("haxeExpr wrong def type: " + expr.def, "");
    }
    
}