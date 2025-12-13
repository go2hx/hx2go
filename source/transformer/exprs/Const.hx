package transformer.exprs;

import haxe.macro.Expr.Constant;

function transformConst(t:Transformer, e:HaxeExpr) {
    switch e.def {
        case EConst(c):
            switch c {
                // TODO: proper handle Null type, for now null bypass
                case CIdent("null"):
                    final ct = HaxeExprTools.stringToComplexType(e.t);
                    e.def = EConst(CIdent(switch ct {
                        case TPath({pack: [], name: "Null", params: [TPType(t)]}):
                            defaultConst(c);
                        default:
                            "nil";
                    }));
                default:
            }
        default:
    }
}

private function defaultConst(c:Constant) {
    return switch c {
        case CInt(_, _):
            "0";
        case CFloat(_, _):
            "0.0";
        case CString(_, _):
            '""';
        default:
            "nil";
    }
}
