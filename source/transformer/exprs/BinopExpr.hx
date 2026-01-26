package transformer.exprs;

import haxe.macro.Expr.Binop;
import haxe.macro.Expr.TypePath;
import haxe.macro.ComplexTypeTools;

function transformBinop(t:Transformer, e:HaxeExpr, op:Binop, e1:HaxeExpr, e2:HaxeExpr) {
    if (handleSideTransform(t, e, op, e1, e2)) return;
    if (handleSideTransform(t, e, op, e2, e1)) return;
    t.iterateExpr(e);
}

function exprToInt(e: HaxeExpr): Int {
    return switch e.def {
        case EConst(CInt(s, _)):
            Std.parseInt(s);
        default:
            0;
    }
}

function handleSideTransform(t:Transformer, e:HaxeExpr, op:Binop, side:HaxeExpr, otherSide:HaxeExpr):Bool {
    return switch side?.def {
        case EGoEnumIndex(expr): {
            if (expr?.t == null)
                return false;

            switch HaxeExprTools.stringToComplexType(expr.t) {
                case TPath(p): handleEnumIndexBinop(t, e, op, expr, otherSide, p);
                case _: false;
            }
        }

        case _: false;
    }
}

function handleEnumIndexBinop(t:Transformer, e:HaxeExpr, op:Binop, side:HaxeExpr, otherSide:HaxeExpr, p: TypePath):Bool {
    return switch [p.pack, p.name] {
        case [["go"], "Result"] if (op == OpEq || op == OpNotEq): {
            final enumIdx = exprToInt(otherSide);
            final isOk = op == OpEq ? (enumIdx == 0) : (enumIdx != 0);
            final cmpError = isOk ? OpEq : OpNotEq;
            final ctError = switch (p.params[1]) {
                case TPType(ct): ct;
                case _: trace("undefined error result type"); null;
            }

            e.def = EBinop(cmpError, {
                t: null,
                def: EField(side, "Error")
            }, {
                t: ComplexTypeTools.toString(ctError),
                def: EConst(CIdent("null"))
            });

            t.iterateExpr(e);
            true;
        }

        case _: false;
    }
}
