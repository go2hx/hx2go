package transformer.exprs;

import haxe.macro.ComplexTypeTools;
import HaxeExpr.HaxeVar;

function transformVarDeclarations(t:Transformer, e:HaxeExpr, vars:Array<HaxeVar>) {
    for (i in 0...vars.length) {
        if (vars[i].type != null && vars[i].expr?.t != null) {
            final varType = ComplexTypeTools.toString(vars[i].type);
            final exprType = vars[i].expr.t;

            if (varType != exprType) { // TODO: anon is compared incorrectly, results in redundant casts.
                vars[i].expr.def = ECast(vars[i].expr.copy(), vars[i].type);
                vars[i].expr.t = varType;
            }
        }

        t.transformComplexType(vars[i].type);
        t.transformExpr(vars[i].expr, e, i);

        vars[i].type = switch (vars[i].type) { // mikaib: go can infer unknown types, not done in transformComplexType as not everything is guarenteed to allow inference.
            case TPath({ name: "Unknown", pack: [] }): null;
            case _: vars[i].type;
        }
    }
}
