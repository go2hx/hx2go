package transformer.exprs;

import haxe.macro.ComplexTypeTools;
import HaxeExpr.HaxeVar;

function transformVarDeclarations(t:Transformer, e:HaxeExpr, vars:Array<HaxeVar>) {
    trace(e, e.t);

    for (i in 0...vars.length) {
        t.transformComplexType(vars[i].type);
        t.transformExpr(vars[i].expr, e, i);

        vars[i].type = switch (vars[i].type) { // mikaib: go can infer unknown types, not done in transformComplexType as not everything is guarenteed to allow inference.
            case TPath({ name: "Unknown", pack: [] }): null;
            case _: vars[i].type;
        }
    }
}
