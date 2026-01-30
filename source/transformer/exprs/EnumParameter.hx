package transformer.exprs;

import HaxeExpr.HaxeExprDef;

function transformEnumParameter(t:Transformer, expr: HaxeExpr, on:HaxeExpr, kind:String, index:Int) {
    final inner = switch on.def {
        case ECast(expr, _): expr;
        case _: on;
    }

    switch HaxeExprTools.stringToComplexType(on.t) { // NOTE: e.t is ResultKind<R, E> with Unknown<n> as params, use inner if we care about types.
        case TPath({ pack: ["go"], name: "ResultKind" }): transformResultAccess(expr, inner, kind);
        case _: null;
    }

    t.iterateExpr(expr);
}

function transformResultAccess(outer: HaxeExpr, inner:HaxeExpr, kind:String) {
    switch kind { // we don't care about the parameter index as there is only one.
        case "Ok": outer.def = EField(inner, "Result");
        case "Err": outer.def = EField(inner, "Error");
        case _: Logging.transformer.error("unknown ResultKind<R, E> kind!");
    }
}
