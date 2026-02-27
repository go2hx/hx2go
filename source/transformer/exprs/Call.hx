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
}
