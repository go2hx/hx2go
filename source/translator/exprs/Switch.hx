package translator.exprs;

function translateSwitch(t:Translator, e:HaxeExpr, cases:Array<HaxeExpr.HaxeCase>, edef:Null<HaxeExpr>):String{
    final buf = new StringBuf();
    if (cases.length != 0) {
        buf.add("if ");
        var elseIfBool = false;
        for (c in cases) {
            if (elseIfBool)
                buf.add(" else if ");
            for (value in c.values) {
                final expr:HaxeExpr = {def: EBinop(OpEq, e, value), t: value.t};
                t.module.transformer.transformExpr(expr);
                buf.add(t.translateExpr(expr));
            }
            if (c.guard != null && !c.guard.def.match(EBlock(_))) {
                if (c.values.length != 0) {
                    buf.add(" && ");
                }
                buf.add(t.translateExpr(c.guard));
            }
            // buf.add(" {\n");
            if (c.expr != null)
                buf.add(t.translateExpr(c.expr));
            // buf.add("}");
            elseIfBool = true;
        }

    }
    if (edef != null) {
        if (cases.length > 0)
            buf.add(" else ");
        buf.add(t.translateExpr(edef));
    }

    return buf.toString();
}