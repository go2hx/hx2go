package transformer.exprs;

import HaxeExpr;
import transformer.Transformer;

function transformIf(t:Transformer, e:HaxeExpr, cond:HaxeExpr, branchTrue:HaxeExpr, branchFalse:HaxeExpr) {
    e.def = EIf(cond, t.ensureBlock(branchTrue), t.ensureBlock(branchFalse));
}
