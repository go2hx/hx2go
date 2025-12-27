package exprparser;

import sys.io.File;
import parser.dump.ExprParser;

function run() {
    final parser = new ExprParser("DEBUG");
    final haxeExpr = parser.parse(File.getContent("tests/exprparser/hello.txt").split("\n"));
    equals(haxeExpr != null, true);
    equals(haxeExpr.def != null, true);
    // goes through the entire expr and makes sure it is exactly equal to:
    // trace("hello")
    switch haxeExpr.def {
        case EBlock(exprs):
            equals(exprs.length, 1);
            if (exprs.length == 1)
                switch exprs[0].def {
                    case ECall(e, params):
                        switch e.def {
                            case EField(_, field):
                                equals(field, "trace");
                            default:
                                equals("haxeExpr wrong def type: " + e.def, "");
                        }
                        equals(params.length, 2);
                        if (params.length == 2)
                            switch params[0].def {
                                case EConst(CString(s)):
                                    equals(s, "hello");
                                default:
                                    equals("haxeExpr wrong def type: " + params[0].def, "");
                            }
                            switch params[1].def {
                                case EObjectDecl(fields):
                                    equals(fields.length, 4);
                                    equals(fields[0].field, "fileName");
                                    equals(fields[1].field, "lineNumber");
                                    equals(fields[2].field, "className");
                                    equals(fields[3].field, "methodName");
                                default:
                                    equals("haxeExpr wrong def type: " + params[1].def, "");
                            }
                default:
                    equals("haxeExpr wrong def type: " + exprs[0].def, "");
            }
        default:
            equals("haxeExpr wrong def type: " + haxeExpr.def, "");
    }
}