package translator.exprs;

import translator.Translator;
import HaxeExpr;
import haxe.macro.Expr.ComplexType;

function translateArrayDeclaration(t:Translator, e:HaxeExpr, values:Array<HaxeExpr>, ct:ComplexType):String {
    return if (isMap(ct)) {
        translateArrayDeclMap(t, values, ct);
    }else{
        final ctStr = t.translateComplexType(ct);
        '&[]${ctStr}{ ${values.map(e -> '${t.translateExpr(e)}').join(', ')} }';
    }
}

private function translateArrayDeclMap(t:Translator, values:Array<HaxeExpr>, ct:ComplexType):String {
    final mapKeys = [];
    final mapValues = [];
    final fields = [];
    for (value in values) {
        switch value.def {
            case EBinop(OpArrow, e1, e2):
                fields.push(t.translateExpr(e1) + ":" + t.translateExpr(e2));
            default:
                throw "expecting OpArrow Binop for ArrayDecl of type map";
        }
    }
    final params = getTypeParams(ct);
    if (params.length != 2)
        throw "Map params is not 2";
    return "map[" + t.translateComplexType(params[0]) + "]" + t.translateComplexType(params[1]) + "{" + fields.join(", ") + "}";
}

function getTypeParams(ct:ComplexType):Array<ComplexType> {
    return switch ct {
        case TPath(p):
            p.params.map(p -> switch p {
                case TPType(t):
                    t;
                case TPExpr(_):
                    throw "param is TPExpr";
            });
        case TAnonymous(_):
            // after transformer
            [TPath({pack: [], name: "string"}), TPath({pack: [], name: "any"})];
        default:
            throw "unable to pull params from non TPath in getTypeParams";
    }
}

function isMap(ct:ComplexType) {
    // TODO Context.follow needed in case it's a named alias
    return switch ct {
        // anon type -> map[string]any
        case TAnonymous(_):
            true;
        case TPath({pack: [], name: "Map"}):
            true;
        default:
            false;
    }
}