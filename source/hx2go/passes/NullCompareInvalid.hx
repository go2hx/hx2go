package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.HxbModuleType;
import hx2go.util.TypeHelper;
import hx2go.util.ExprHelper;
import hx2go.normaliser.Semantics;
import hxb.Ast.HxbBinop;
import hxb.HxbType;

/**
 * Compiler pass to handle invalid null comparisons.
 * Casts the non-null side to a dynamic type to avoid type errors.
 * This ensures that comparisons like `x == null` or `null == x` do not cause type errors
 * when `x` is a non-nullable type.
 *
 * Prompted by https://github.com/HaxeFoundation/haxe/blob/development/tests/unit/src/unit/issues/Issue4842.hx
 * Analysis at https://github.com/go2hx/hx2go/issues/275 
 * For "x == null on value-type Null → x != nil type mismatch" see Haxe issues 3094 & 4842
 */
class NullCompareInvalid extends CompilerPass {
	public function match(expr:HxbTypedExpr):Bool {
		return switch expr.expr {
			case TBinop(OpEq | OpNotEq, left, right) if (isNullLiteral(left) || isNullLiteral(right)):
				var i = 0;
				i += Semantics.isNullableExpr(context, left) ? 0 : 1;
				i += Semantics.isNullableExpr(context, right) ? 0 : 1;
				i == 1;
			case _: false;
		}
	}

	static function isNullLiteral(e:HxbTypedExpr):Bool {
		if (e == null) {
			return false;
		}

		return switch e.expr {
			case TConst(TNull): true;
			case TParenthesis(inner) | TMeta(_, inner) | TCast(inner, _): isNullLiteral(inner);
			case _: false;
		}
	}

	public function execute(expr:HxbTypedExpr, frame:ContextFrame):Void {
		switch expr.expr {
			case TBinop(b_op, b_left, b_right):
                if (isNullLiteral(b_left)){
                    b_right = ExprHelper.createCast(b_right, TDynamicAny);
                }else if (isNullLiteral(b_right)) {
                    b_left = ExprHelper.createCast(b_left, TDynamicAny);
                }else {
                    return; // should not happen, neither side is null
                }
                expr.expr = TBinop(b_op, b_left, b_right);
			case _:
				return;
		}
	}
}
