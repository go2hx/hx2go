package transformer.exprs;

import haxe.macro.ComplexTypeTools;
import HaxeExpr.HaxeVar;

function transformVarDeclarations(t:Transformer, e:HaxeExpr, vars:Array<HaxeVar>) {
    for (i in 0...vars.length) {
        if (vars[i].expr == null) {
            vars[i].expr = {
                t: ComplexTypeTools.toString(vars[i].type),
                def: EConst(CIdent("null"))
            };
        }

        t.transformComplexType(vars[i].type);
        t.transformExpr(vars[i].expr, e, i);
    }
}
