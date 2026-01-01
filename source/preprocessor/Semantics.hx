package preprocessor;

import HaxeExpr;

enum ExprKind {
    Stmt;
    Expr;
    EitherKind; // either `Stmt` or `Expr`, example is ECall(...) which can be used as both.
}

class Semantics {

    /**
     * Given the expression `expr` this function will return one of the following cases:
     * Stmt - Something that can only be used as a statement, like `EVars(...)`
     * Expr - Something that can only be used as an expression.
     * EitherKind - Something that can be used in the place of both, like `ECall(...)`
     * @param expr Input expression
     */
    public static function getExprKind(expr: HaxeExpr): ExprKind {
        return switch expr.def {
            case EBlock(_), EVars(_), EWhile(_, _, _), EIf(_, _, _), EReturn(_), EBinop(OpAssignOp(_), _, _), EBinop(OpAssign, _, _), EUnop(OpIncrement, _, _), EUnop(OpDecrement, _, _), EBreak: Stmt;
            case EConst(_), EField(_, _, _), ECast(_, _), EBinop(_, _, _), EUnop(_, _, _), ENew(_, _), EParenthesis(_): Expr;
            case ECall(_, _): EitherKind;
            case _: trace('unknown kind for:', expr); EitherKind;
        }
    }

    /**
     * Will check if the given expression `expr` has side effects.
     * @param expr The expression to recursively check for side effects.
     */
    public static function hasSideEffects(expr: HaxeExpr): Bool {
        return switch expr.def {
            // TODO: we always assume ECall(...) has side effects, even if that is not the case. If we were to introduce a lookup then the preprocessor can't parralelise per unit (dump file)...
            // is there a way in which we can get the best of both worlds (per unit parallelisation AND side effect flag lookup)?
            // we could potentially make the preprocessor a step after transformation has completed, but, that would significantly complicate the transformation process which we also don't want :(
            case EBinop(OpAssign, _, _), EBinop(OpAssignOp(_), _, _), EUnop(OpIncrement, _, _), EUnop(OpDecrement, _, _), ECall(_, _), ENew(_, _), EReturn(_), EBreak: true;
            case EVars(vars):
                for (v in vars) if (v.expr != null && hasSideEffects(v.expr)) return true;
                false;
            case EBinop(_, e1, e2): hasSideEffects(e1) || hasSideEffects(e2);
            case EUnop(_, _, e), EField(e, _, _), EParenthesis(e), ECast(e, _): hasSideEffects(e);
            case EBlock(exprs):
                for (e in exprs) if (hasSideEffects(e)) return true;
                false;
            case EIf(econd, eif, eelse):
                hasSideEffects(econd) || hasSideEffects(eif) || (eelse != null && hasSideEffects(eelse));
            case EWhile(econd, ebody, _): hasSideEffects(econd) || hasSideEffects(ebody);
            case EConst(_): false;
            case _: trace('unknown if expr has side effects'); true;
        }
    }

    /**
     * Checks if `p` can hold `expr`
     * @params p The parent which holds `expr`
     * @param expr The expression or statement held in `p`
     */
    public static function canHold(p: HaxeExpr, expr: HaxeExpr): Bool {
        return switch getExprKind(expr) {
            case Stmt: canHoldStmt(p);
            case Expr: canHoldExpr(p);
            case EitherKind: true;
        }
    }

    /**
     * Checks if the given `expr` can hold a statement.
     * @param The input expression.
     */
    public static function canHoldStmt(expr: HaxeExpr): Bool {
        return switch expr.def {
            case EBlock(_), EWhile(_), EIf(_): true;
            case _: false;
        }
    }

    /**
     * Checks if the given `expr` can hold an expression.
     * @param The input expression.
     */
    public static function canHoldExpr(expr: HaxeExpr): Bool {
        return switch expr?.def {
            case EBlock(_): false;
            case _: true;
        }
    }

}
