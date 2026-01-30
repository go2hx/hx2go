package transformer.exprs;

import HaxeExpr.HaxeExprDef;
import haxe.macro.Expr.ComplexType;
import HaxeExpr.HaxeObjectField;
import HaxeExpr.HaxeField;

function transformObjectDeclaration(t:Transformer, fields:Array<HaxeObjectField>, ct:ComplexType):HaxeExprDef {
    transformObjectDeclTypes(t, fields, ct);
    final list:Array<HaxeExpr> = [];
    for (field in fields) {
        t.transformExpr(field.expr);
        // expr -> any(expr)
        field.expr.def = ECheckType({def: field.expr.def, t: field.expr.t}, TPath({pack: [], name: "any"}));
        final fieldName:HaxeExpr = {def: EConst(CString(field.field)), t: null};
        // a => b
        list.push({def: EBinop(OpArrow, fieldName, field.expr), t: null});
    }
    return EArrayDecl(list, ct);
}

function transformObjectDeclTypes(t:Transformer, fields:Array<HaxeObjectField>, ct:ComplexType) {
    switch ct {
        case TAnonymous(anonFields):
            for (i in 0...anonFields.length) {
                final ct = switch anonFields[i].kind {
                    case FVar(varType, _):
                        varType;
                    case FFun(f):
                        TFunction(f.args.map(arg -> arg.type), f.ret);
                    case FProp(get, set, t, e):
                        TPath({pack: [], name: "Dynamic"});
                        
                };
                t.transformComplexType(ct);
                // fields come in unordered
                for (j in 0...fields.length) {
                    if (fields[j].field == anonFields[i].name) {
                        fields[j].t = ct;
                        break;
                    }
                }
            }
        default:
            Logging.transformer.error('not TAnon: $ct');
            throw "Not TAnon";
    }
}