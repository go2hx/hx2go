package exprparser;

import sys.io.File;
import parser.dump.ExprParser;

function run() {
    final parser = new ExprParser("DEBUG");
    final lines = Util.normalizeCLRF(File.getContent("tests/exprparser/hello.txt")).split("\n");
    final obj = parser.parseObject(lines);
    parser.printObject(obj);
    parser.reset();
    final haxeExpr = parser.parse(lines);
    assert(haxeExpr != null, true);
    assert(haxeExpr.def != null, true);
    // goes through the entire expr and makes sure it is exactly equal to:
    // trace("hello")
    switch haxeExpr.def {
    case EFunction(kind, f):
    switch f.expr.def {
        case EBlock(exprs):
            assert(exprs.length, 1);
            if (exprs.length == 1)
                switch exprs[0].def {
                    case ECall(e, params):
                        switch e.def {
                            case EField(_, field):
                                assert(field, "trace");
                            default:
                                assert("haxeExpr wrong def type: " + e.def, "");
                        }
                        assert(params.length, 2);
                        if (params.length == 2)
                            switch params[0].def {
                                case EConst(CString(s)):
                                    assert(s, "hello");
                                default:
                                    assert("haxeExpr wrong def type: " + params[0].def, "");
                            }
                            switch params[1].def {
                                case EObjectDecl(fields):
                                    assert(fields.length, 4);
                                    assert(fields[0].field, "fileName");
                                    assert(fields[1].field, "lineNumber");
                                    assert(fields[2].field, "className");
                                    assert(fields[3].field, "methodName");
                                default:
                                    assert("haxeExpr wrong def type: " + params[1].def, "");
                            }
                default:
                    assert("haxeExpr wrong def type: " + exprs[0].def, "");
            }
        default:
            assert("haxeExpr wrong def type: " + haxeExpr.def, "");
    }
    default:
        assert("haxeExpr wrong def type: " + haxeExpr.def, "");
}
}