package transformer.exprs;

import HaxeExpr;
import transformer.Transformer;

function transformWhile(t:Transformer, e:HaxeExpr, cond:HaxeExpr, body:HaxeExpr, norm:Bool) {
    e.def = EWhile(cond, t.ensureBlock(body), norm);
}
