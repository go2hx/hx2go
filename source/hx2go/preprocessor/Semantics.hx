package hx2go.preprocessor;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.tools.TypedExprTools;
import hx2go.hxb.Ast.HxbBinop;

class Semantics {

    public static function getExprKind(e: HxbTypedExpr): ExprKind {
        return switch e.expr {
            case TSwitch(_) |
                 TBlock(_) |
                 TVar(_) |
                 TWhile(_) |
                 TIf(_) |
                 TReturn(_) |
                 TBinop(OpAssignOp(_), _, _) |
                 TBinop(OpAssign, _, _) |
                 TUnop(OpIncrement, _, _) |
                 TUnop(OpDecrement, _, _) |
                 TThrow(_) |
                 TTry(_) |
                 TBreak |
                 TContinue: KStmt;

            case TFunction(_) |
                 TObjectDecl(_) |
                 TArrayDecl(_) |
                 TArray(_) |
                 TConst(_) |
                 TField(_) |
                 TCast(_) |
                 TBinop(_) |
                 TUnop(_) |
                 TNew(_) |
                 TParenthesis(_) |
                 TEnumIndex(_) |
                 TEnumParameter(_) |
                 TIdent(_) |
                 TLocal(_) |
                 TMeta(_) |
                 TTypeExpr(_): KExpr;

            case TCall(_): KEither;
        }
    }

    public static function canHold(p: HxbTypedExpr, expr: HxbTypedExpr): Bool {
        return switch getExprKind(expr) {
            case KStmt: canHoldStmt(p);
            case KExpr: canHoldExpr(p);
            case KEither: true;
        }
    }

    public static function canHoldStmt(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TBlock(_) |
                 TIf(_) |
                 TSwitch(_) |
                 TFunction(_) |
                 TWhile(_): true;

            case _: false;
        }
    }

    public static function canHoldExpr(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TBlock(_): false;
            case _: true;
        }
    }

    public static function goingToMutate(e: HxbTypedExpr, parent: HxbTypedExpr): Bool {
        var res = !canHold(parent, e);

        TypedExprTools.iter(e, l -> {
            if (l?.expr == null) {
                return;
            }

            res = res || goingToMutate(l, e);
        });

        return res;
    }

    public static function isConstant(e: HxbTypedExpr):Bool {
        return switch e.expr {
            case TConst(TThis | TSuper): false;
            case TConst(_): true;
            case _: false;
        }
    }

    public static function hasSideEffects(e: HxbTypedExpr): Bool {
        return true; // TODO: impl
    }

}
