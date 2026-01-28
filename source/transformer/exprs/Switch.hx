package transformer.exprs;

import HaxeExpr.HaxeCase;
import haxe.macro.Expr.Binop;
import haxe.macro.Expr.TypePath;
import haxe.macro.ComplexTypeTools;

function exprToInt(e: HaxeExpr): Int {
    return switch e.def {
        case EConst(CInt(s, _)): Std.parseInt(s);
        case _: 0;
    }
}

function transformSwitch(t:Transformer, expr: HaxeExpr, on:HaxeExpr, cases: Array<HaxeCase>, defaultCase: Null<HaxeExpr>) {
    switch on?.def {
        case EParenthesis({ t: _, def: EGoEnumIndex(e) }):
            final ct = HaxeExprTools.stringToComplexType(e.t);

            switch ct {
                case TPath(p) if (p.pack.length == 1 && p.pack[0] == "go" && (p.name == "Result" || p.name == "ResultKind")):
                    handleResultSwitch(t, expr, e, cases, defaultCase, p);

                case _:
                    t.iterateExpr(expr);
            }

        case _:
            t.iterateExpr(expr);
    }
}

function handleResultSwitch(t:Transformer, expr: HaxeExpr, on:HaxeExpr, cases: Array<HaxeCase>, defaultCase: Null<HaxeExpr>, resultType: TypePath) {
    var success: HaxeExpr = null;
    var failure: HaxeExpr = null;

    for (_case in cases) {
        switch exprToInt(_case.values[0]) {
            case 0: success = _case.expr;
            case 1: failure = _case.expr;
            case _: null;
        }
    }

    if (success == null) {
        success = defaultCase;
    }

    if (failure == null) {
        failure = defaultCase;
    }

    var errType = switch resultType.params[1] {
        case TPType(ct): ct;
        case _: null;
    }

    var errAccess: HaxeExpr = { // NOTE: normally care must be taken when duplicating the expression on which you switch, but, we know that tuples are put into temporary variables before switching on them.
        t: ComplexTypeTools.toString(errType),
        def: EField(on,"Error")
    };

    expr.def = EIf(
        {
            t: null,
            def: EParenthesis({
                t: null,
                def: EBinop(Binop.OpNotEq, errAccess, {
                    t: errAccess.t,
                    def: EConst(CIdent("null"))
                })
            })
        },
        failure != null ? failure : {
            t: null,
            def: EBlock([])
        },
        success != null ? success : {
            t: null,
            def: EBlock([])
        }
    );

    t.iterateExpr(expr);
}
