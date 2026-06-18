package hx2go.preprocessor;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.tools.TypedExprTools;
import hx2go.hxb.Ast.HxbBinop;
import haxe.runtime.Copy;
import hx2go.hxb.Typed.HxbTypedExprDef;

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

    public static function ensure(parent: HxbTypedExpr, children: Array<HxbTypedExpr>, preprocessor: Preprocessor, scope: Scope, ancestor: Null<Ancestor>): Void {
        var willMutate = false;
        for (child in children) {
            if (child.expr == null) {
                continue;
            }

            willMutate = willMutate || hasSideEffects(child) || goingToMutate(child, parent);
        }

        if (!willMutate) {
            return preprocessor.iterateExpr(parent, scope, ancestor);
        }

        switch parent.expr {
            case TBinop(OpBoolAnd, left, right): // x && y -> if (x) y else false
                parent.expr = TIf(
                    left,
                    right,
                    new HxbTypedExpr(TConst(
                        TBool(false)
                    ), TBool, null)
                );

                preprocessor.processExpr(parent, scope, ancestor);

            case TBinop(OpBoolOr, left, right): // x || y -> if (x) true else y
                parent.expr = TIf(
                    left,
                    new HxbTypedExpr(TConst(
                        TBool(true)
                    ), TBool, null),
                    right
                );

                preprocessor.processExpr(parent, scope, ancestor);

            case _: // f(x, y) -> z = x; w = y; f(z, w);
                var ca: Ancestor = { up: ancestor, node: parent, scope: scope };

                for (child in children) {
                    if (!goingToMutate(child, parent) && !isConstant(child)) child.expr = scope.temp(parent, Copy.copy(child), preprocessor, scope, ca).expr;
                    else preprocessor.processExpr(child, scope, ca);
                }
        }
    }

}
