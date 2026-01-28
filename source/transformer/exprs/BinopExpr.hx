package transformer.exprs;

import haxe.macro.Expr.Binop;
import haxe.macro.Expr.TypePath;
import haxe.macro.ComplexTypeTools;
import haxe.macro.Expr.ComplexType;

function transformBinop(t:Transformer, e:HaxeExpr, op:Binop, e1:HaxeExpr, e2:HaxeExpr) {
    if (handleSideTransform(t, e, op, e1, e2)) return;
    if (handleSideTransform(t, e, op, e2, e1)) return;

    t.iterateExpr(e);
}

function exprToInt(e: HaxeExpr): Int {
    return switch e.def {
        case EConst(CInt(s, _)): Std.parseInt(s);
        case _: 0;
    }
}

function handleSideTransform(t:Transformer, e:HaxeExpr, op:Binop, side:HaxeExpr, otherSide:HaxeExpr):Bool {
    return switch side?.def {
        case EGoEnumIndex(expr): {
            if (expr?.t == null)
                return false;

            switch HaxeExprTools.stringToComplexType(expr.t) {
                case TPath({ pack: ["go"], name: "Result", params: [_, TPType(errType)] }) if (op == OpEq || op == OpNotEq): handleResultBinop(t, e, op, expr, otherSide, errType);
                case _: false;
            }
        }

        case _: false;
    }
}

function handleResultBinop(t:Transformer, e:HaxeExpr, op:Binop, side:HaxeExpr, otherSide:HaxeExpr, errType:ComplexType):Bool {
    final enumIdx = exprToInt(otherSide);
    final cmpError = (op == OpEq) == (enumIdx == 0) ? OpEq : OpNotEq;

    e.def = EBinop(cmpError, {
        t: null,
        def: EField(side, "Error")
    }, {
        t: ComplexTypeTools.toString(errType),
        def: EConst(CIdent("null"))
    });

    t.iterateExpr(e);

    return true;
}
