package transformer.exprs;

import HaxeExpr;
import transformer.Transformer;

function transformCall(t:Transformer, self:HaxeExpr, e:HaxeExpr, params:Array<HaxeExpr>) {
    switch e?.def {
        case EConst(CIdent("super")): // transform super(...) to this.Super.New(...)
            e.def = EField({
                t: null,
                def: EField({
                    t: null,
                    def: EConst(CIdent("this"))
                }, 'Super')
            }, 'New');

        case _: null;
    }

    t.iterateExpr(self);
    // special case for enum createInstance
    switch e.special {
        case FEnum(_, _):
            switch e.def {
                case ECall(_, params2):
                    final lastParam = params2[params2.length - 1];
                    switch lastParam.def {
                        case EArrayDecl(values, ct):
                            for (param in params)
                                values.push(param);
                            self.def = e.def;
                        default:
                    }
                default:
            }
        default:
    }
}
