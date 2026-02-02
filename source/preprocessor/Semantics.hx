package preprocessor;

import HaxeExpr;
import transformer.Transformer;
import haxe.macro.Expr.ComplexType;

enum ExprKind {
	Stmt;
	Expr;
	EitherKind; // either `Stmt` or `Expr`, example is ECall(...) which can be used as both.
}

class Semantics {
	/**
	 * Given a parent and it's children, it will ensure that if any reordering happens that it correctly maintains the original semantics.
	 * **WARNING!** This function will mutate expressions in place! Be careful about where and when you call this function!!
	 * @param p The parent
	 * @param children Children of the parent (the list on which it will ensure semantics are maintained)
	 * @param ctx The preprocessor in which this function got called from
	 * @param scope The scope of the current expression
	 */
	public static function ensure(p:HaxeExpr, children:Array<HaxeExpr>, ctx:Preprocessor, scope:Scope):Void {
		var willMutate = false;
		for (c in children) {
		    if (c?.def == null) continue;
			willMutate = willMutate || hasSideEffects(ctx, c) || goingToMutate(c, p);
		}

		if (!willMutate) {
			ctx.iterateExprPost(p, scope);
			return;
		}

		switch p.def {
            case EBinop(OpBoolAnd, e1, e2): // `a && b` -> `(if (a) b else false)`
                p.def = EIf(
                    {
                        t: null,
                        def: EBinop(OpEq, e1, {
                            t: null,
                            def: EConst(CIdent('true'))
                        })
                    },
                    e2, {
                        t: null,
                        def: EConst(CIdent('false'))
                    }
                );

                ctx.processExpr(p, scope);

            case EBinop(OpBoolOr, e1, e2): // `a || b` -> `(if (a) true else b)`
                p.def = EIf(
                    {
                        t: null,
                        def: EBinop(OpEq, e1, {
                            t: null,
                            def: EConst(CIdent('true'))
                        })
                    },
                    {
                        t: null,
                        def: EConst(CIdent('true'))
                    }, e2
                );

                ctx.processExpr(p, scope);

            default: // any other expression (example: `x(a, b)` -> `$1 = a; $2 = b; x($1, $2);`)
                var idx = 0;
                for (c in children) {
                    if (c?.def == null) continue;
                    if (goingToMutate(c, p)) ctx.processExpr(c, scope);
                    else if (!isConstant(c)) {
                        var tmp = ctx.annonymiser.assign(c.copy());
                        ctx.insertExprsBefore([tmp.decl], p, scope);
                        ctx.processExpr(tmp.decl, scope);

                        c.def = tmp.ident.def;
                    }
                }
        }
	}

	/**
	 * Checks if `e` is constant.
	 * @param e Expression
	 */
	public static function isConstant(e:HaxeExpr):Bool {
	    return switch e.def {
			case EConst(CIdent(_)): false;
			case EConst(_): true;
			case _: false;
		}
	}

	/**
	 * Checks if any conversion will be done on `e`
	 * @param e The expression to check
	 * @param parent The parent in which `e` is held
	 */
	public static function goingToMutate(e:HaxeExpr, parent:HaxeExpr):Bool {
		var res = !canHold(parent, e);

		HaxeExprTools.iter(e, (l) -> {
		    if (l?.def == null) return;
			res = res || goingToMutate(l, e);
		});

		return res;
	}

	/**
	 * Given the expression `expr` this function will return one of the following cases:
	 * Stmt - Something that can only be used as a statement, like `EVars(...)`
	 * Expr - Something that can only be used as an expression.
	 * EitherKind - Something that can be used in the place of both, like `ECall(...)`
	 * @param expr Input expression
	 */
	public static function getExprKind(expr:HaxeExpr):ExprKind {
		return switch expr.def {
			case ESwitch(_, _, _), EBlock(_), EVars(_), EWhile(_, _, _), EIf(_, _, _), EReturn(_), EBinop(OpAssignOp(_), _, _), EBinop(OpAssign, _, _),
				EUnop(OpIncrement, _, _), EUnop(OpDecrement, _, _), EBreak: Stmt;
			case EConst(_), EField(_, _, _), ECast(_, _), EBinop(_, _, _), EUnop(_, _, _), ENew(_, _), EParenthesis(_): Expr;
			case EArray(_): Expr;
			case ECall(_, _): EitherKind;
			case EFunction(_, _): Expr;
			case EArrayDecl(_): Expr;
			case EObjectDecl(_): Expr;
			case _:
				Logging.preprocessor.error('unknown kind for: $expr');
				EitherKind;
		}
	}

	/**
	 * Will check if the given expression `expr` has side effects.
	 * @param expr The expression to recursively check for side effects.
	 */
	public static function hasSideEffects(ctx: Preprocessor, expr:HaxeExpr):Bool {
		return switch expr.def {
			case ECall(e, params):
				!analyzeFunctionCall(ctx, expr).isPure;
			case EBinop(OpAssign, _, _), EBinop(OpAssignOp(_), _, _), EUnop(OpIncrement, _, _), EUnop(OpDecrement, _, _), ENew(_, _), EReturn(_),
				EBreak: true;
			case EVars(vars):
				for (v in vars)
					if (v.expr != null && hasSideEffects(ctx, v.expr))
						return true;
				false;
			case EBinop(_, e1, e2), EArray(e1, e2): hasSideEffects(ctx, e1) || hasSideEffects(ctx, e2);
			case EUnop(_, _, e), EField(e, _, _), EParenthesis(e), ECast(e, _), EGoEnumParameter(e, _, _), EGoEnumIndex(e): hasSideEffects(ctx, e);
			case EBlock(exprs), EArrayDecl(exprs, _):
				for (e in exprs)
					if (hasSideEffects(ctx, e))
						return true;
				false;
			case EIf(econd, eif, eelse): hasSideEffects(ctx, econd) || hasSideEffects(ctx, eif) || (eelse != null && hasSideEffects(ctx, eelse));
			case EWhile(econd, ebody, _): hasSideEffects(ctx, econd) || hasSideEffects(ctx, ebody);
			case EConst(_): false;
			case EObjectDecl(fields):
				for (field in fields)
					if (hasSideEffects(ctx, field.expr))
						return true;
				false;
			case _:
				Logging.preprocessor.warn('unknown if expr has side effects (safely assuming it does), for: $expr');
				true;
		}
	}

	/**
	 * Checks if `p` can hold `expr`
	 * @params p The parent which holds `expr`
	 * @param expr The expression or statement held in `p`
	 */
	public static function canHold(p:HaxeExpr, expr:HaxeExpr):Bool {
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
	public static function canHoldStmt(expr:HaxeExpr):Bool {
		return switch expr.def {
			case EBlock(_), EWhile(_), EIf(_), ESwitch(_): true;
			case _: false;
		}
	}

	/**
	 * Checks if the given `expr` can hold an expression.
	 * @param The input expression.
	 */
	public static function canHoldExpr(expr:HaxeExpr):Bool {
		return switch expr?.def {
			case EBlock(_): false;
			case _: true;
		}
	}

	/**
	 * Gives some useful information given a function call expression.
	 * @param e The function call expression
	 */
	public static function analyzeFunctionCall(ctx: Preprocessor, e:HaxeExpr): { isExtern: Bool, isPure: Bool, failed: Bool } {
		if (e?.def == null) {
			return { isExtern: false, isPure: false, failed: true };
		}

		return switch e.def { // TODO: cache results?
			case ECall(cexpr, args):
				switch cexpr.def {
					case EField(fexpr, fieldName, kind):
						var isPure = false;
						var pack = switch cexpr.special {
							case FStatic(p, _): p.split(".");
							case FInstance(p): p.split(".");
							case _: null;
						};

						if (pack == null || pack.length == 0) {
							return { isExtern: false, isPure: false, failed: true };
						}

						var className = pack.pop();
						var funcName = fieldName;

						final td = ctx.module.resolveClass(pack, className, ctx.module.path);
						if (td == null) {
							return { isExtern: false, isPure: false, failed: true };
						}

						for (meta in td.meta()) {
							if (meta.name == ":pure") {
								isPure = true;
								break;
							}
						}

						for (field in td.fields) {
							if (field.name != funcName) continue;

							for (meta in field.meta) {
								if (meta.name == ":pure") {
									isPure = true;
								}
							}

							break;
						}

						{ isExtern: td.isExtern, isPure: isPure, failed: false };

					case _: { isExtern: false, isPure: false, failed: true };
				}

			case _: { isExtern: false, isPure: false, failed: true };
		}
	}

	/**
	 * Given an integer type, will return if it's signed or not.
	 * @param t The type to check
	 */
	public static function getIntegerSigned(t: ComplexType): Bool {
		return switch t {
			case TPath({ pack: [], name: "Int" }) | TPath({ pack: ["go"], name: "GoInt" | "Int8" | "Int16" | "Int32" | "Int64" }): true;
			case TPath({ pack: [], name: "UInt" }) | TPath({ pack: ["go"], name: "GoUInt" | "UInt8" | "UInt16" | "UInt32" | "UInt64" | "Rune" | "Byte" }): false;
			case _: Logging.preprocessor.error('unrecognised integer type: $t'); true; // abstract should not cause this code path anyway.
		}
	}

	/**
	 * Given an integer type, will return it's width in bits.
	 * @param t The type to check
	 */
	public static function getIntegerWidth(t: ComplexType): Int {
		return switch t {
			case TPath({ pack: [], name: "Int" | "UInt" }) | TPath({ pack: ["go"], name: "Int" | "UInt" | "GoInt" | "GoUInt" }): 64; // for GoInt I assume the wider type, i could add special handling but that is extra comlexity for little (to no) gain.
			case TPath({ pack: ["go"], name: "Int8" | "UInt8" | "Rune" | "Byte" }): 8;
			case TPath({ pack: ["go"], name: "Int16" | "UInt16" }): 16;
			case TPath({ pack: ["go"], name: "Int32" | "UInt32" }): 32;
			case TPath({ pack: ["go"], name: "Int64" | "UInt64" }): 64;
			case _: Logging.preprocessor.error('unrecognised integer type: $t'); 64; // abstract should not cause this code path anyway.
		}
	}

	/**
	 * Checks if the given type is a Float type (or should be treated as one).
	 * @param t The type to check
	 */
	public static function isFloatType(t: ComplexType): Bool {
		return switch t {
			case TPath({ pack: [], name: "Float" }) | TPath({ pack: ["go"], name: "Float32" | "Float64" }): true;
			case _: false;
		}
	}

	/**
	 * Checks if the given type is a Boolean type (or should be treated as one).
	 * @param t The type to check
	 */
	public static function isBoolType(t: ComplexType): Bool {
		return switch t {
			case TPath({ pack: [], name: "Bool" }): true;
			case _: false;
		}
	}

	/**
	 * Checks if the given type is an Integer type (or should be treated as one).
	 * @param t The type to check
	 */
	public static function isIntegerType(t: ComplexType): Bool {
		return switch t {
			case TPath({ pack: [], name: "Int" | "UInt" }) | TPath({ pack: ["go"], name: "GoInt" | "GoUInt" | "Int8" | "UInt8" | "Int16" | "UInt16" | "Int32" | "UInt32" | "Int64" | "UInt64" | "Rune" |  "Byte" }): true;
			case _: false;
		}
	}

	/**
	 * Checks if the given type is a String type (or should be treated as one).
	 * @param t The type to check
	 */
	public static function isStringType(t: ComplexType): Bool {
		return switch t {
			case TPath({ pack: [], name: "String" }): true;
			case _: false;
		}
	}

}
