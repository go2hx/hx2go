package hx2go.normaliser;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.tools.TypedExprTools;
import hx2go.hxb.Ast.HxbBinop;
import haxe.runtime.Copy;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.HxbType;

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
                 TTypeExpr(_): KExpr;

            case TMeta(_, e):
                getExprKind(e);

            case TCall(_):
                KEither;
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
                 TTry(_) |
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

    public static function isConstant(e: HxbTypedExpr): Bool {
        return switch e.expr {
            case TConst(TThis | TSuper): false;
            case TConst(_): true;
            case TParenthesis(e1) | TMeta(_, e1) | TCast(e1, _): isConstant(e1);
            case TUnop(OpNeg | OpNegBits, _, e1): isConstant(e1);
            case _: false;
        }
    }

    // TODO: check purity status for TCall
    public static function hasSideEffects(e: HxbTypedExpr): Bool {
        return switch e.expr {
            case TConst(_) | TLocal(_) | TTypeExpr(_) | TIdent(_): false;
            case TParenthesis(e1) | TMeta(_, e1) | TCast(e1, _) | TEnumIndex(e1) | TEnumParameter(e1, _, _): hasSideEffects(e1);
            case TBinop(OpAssign | OpAssignOp(_), _, _): true;
            case TBinop(_, a, b): hasSideEffects(a) || hasSideEffects(b);
            case TUnop(OpIncrement | OpDecrement, _, _): true;
            case TUnop(_, _, e1): hasSideEffects(e1);
            case TField(e1, _): hasSideEffects(e1); // TODO: check; getters/setters
            case TArray(a, b): hasSideEffects(a) || hasSideEffects(b); // TODO: check; arrayAccess meta
            case _: true; // conservative assumption
        };
    }

    public static function ensure(parent: HxbTypedExpr, children: Array<HxbTypedExpr>, preprocessor: Normaliser, scope: Scope, ancestor: Null<Ancestor>): Void {
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

                var lastImpure = -1;
                for (i in 0...children.length) {
                    var c = children[i];
                    if (c.expr != null && (hasSideEffects(c) || goingToMutate(c, parent))) {
                        lastImpure = i;
                    }
                }

                for (i in 0...children.length) {
                    var child = children[i];
                    if (child.expr == null) {
                        continue;
                    }

                    if (goingToMutate(child, parent)) preprocessor.processExpr(child, scope, ca);
                    else if (i < lastImpure && !isConstant(child)) child.expr = scope.temp(parent, Copy.copy(child), preprocessor, scope, ca).expr;
                    else preprocessor.processExpr(child, scope, ca);
                }
        }
    }

    public static function getIntegerSigned(t: HxbType): Bool {
        return switch t {
            case TAbstract({ pack: [], name: "Int" | "Dynamic" }, _) | TAbstract({ pack: ["go"], name: "GoInt" | "Int8" | "Int16" | "Int32" | "Int64" }, _) | TInt | TDynamicAny | TDynamic(_): true;
            case TAbstract({ pack: [], name: "UInt" }, _) | TAbstract({ pack: ["go"], name: "GoUInt" | "UInt8" | "UInt16" | "UInt32" | "UInt64" | "Rune" | "Byte"  }, _): false;
            case _: true; // abstract should not cause this code path anyway.
        }
    }

    public static function getIntegerWidth(t: HxbType): Int {
        return switch t {
            case TAbstract({ pack: [], name: "Int" | "Dynamic" | "UInt" }, _) | TAbstract({ pack: ["go"], name: "Int" | "UInt" | "GoInt" | "GoUInt" }, _) | TInt | TDynamicAny | TDynamic(_): 64; // for GoInt I assume the wider type, i could add special handling but that is extra complexity for little (to no) gain.
            case TAbstract({ pack: ["go"], name: "Int8" | "UInt8" | "Rune" | "Byte" }, _): 8;
            case TAbstract({ pack: ["go"], name: "Int16" | "UInt16" }, _): 16;
            case TAbstract({ pack: ["go"], name: "Int32" | "UInt32" }, _): 32;
            case TAbstract({ pack: ["go"], name: "Int64" | "UInt64" }, _): 64;
            case _: 64; // abstract should not cause this code path anyway.
        }
    }
    
    public static function isFloatType(t: HxbType): Bool {
        return switch t {
            case TAbstract({ pack: [], name: "Float" }, _) | TAbstract({ pack: ["go"], name: "Float32" | "Float64" }, _) | TFloat: true;
            case _: false;
        }
    }
    
    public static function isBoolType(t: HxbType): Bool {
        return switch t {
            case TAbstract({ pack: [], name: "Bool" }, _) | TBool: true;
            case _: false;
        }
    }
    
    public static function isIntegerType(t: HxbType): Bool {
        return switch t {
            case TAbstract({ pack: [], name: "Int" | "UInt" }, _) | TAbstract({ pack: ["go"], name: "GoInt" | "GoUInt" | "Int8" | "UInt8" | "Int16" | "UInt16" | "Int32" | "UInt32" | "Int64" | "UInt64" | "Rune" |  "Byte" }, _) | TInt: true;
            case _: false;
        }
    }
    
    public static function isStringType(t: HxbType): Bool {
        return switch t {
            case TAbstract({ pack: [], name: "String" }, _) | TString: true;
            case _: false;
        }
    }

    public static function isNullableType(t: HxbType): Bool {
        return switch t {
            case TAbstract({ pack: [], name: "Null" }, _): true;
            case _: false;
        }
    }

    public static function getNullableType(t: HxbType): HxbType {
        return switch t {
            case TAbstract({ pack: [], name: "Null" }, p): p[0];
            case _: null;
        }
    }

    static function isPanicCall(e: HxbTypedExpr): Bool {
        return switch e.expr {
            case TCall({ expr: TCall({ expr: TIdent("__go__") }, args) }, _)
                if (args.length > 0 && args[0].expr.match(TConst(TString("panic")))): true;
            case _: false;
        }
    }

    public static function allPathsReturn(e: HxbTypedExpr): Bool {
        return switch e.expr {
            case TReturn(_) | TThrow(_): true;
            case TCall(_) if (isPanicCall(e)): true;

            case TBlock(exprs):
                exprs.length > 0 && allPathsReturn(exprs[exprs.length - 1]);

            case TIf(_, eif, eelse):
                eelse != null && allPathsReturn(eif) && allPathsReturn(eelse);

            case TSwitch(_, cases, edef):
                var ok = cases.length > 0;
                for (c in cases) ok = ok && allPathsReturn(c.expr);
                if (edef != null) ok = ok && allPathsReturn(edef);
                ok;

            case TTry(e1, catches):
                if (!allPathsReturn(e1)) false;
                else {
                    var ok = true;
                    for (c in catches) ok = ok && allPathsReturn(c.expr);
                    ok;
                }

            case TWhile(econd, e1, true) if (isConstant(econd) && econd.expr.match(TConst(TBool(true)))):
                allPathsReturn(e1);

            case TParenthesis(e1) | TMeta(_, e1): allPathsReturn(e1);

            case _: false;
        }
    }
    
}
