package runtime;

import go.reflect.Reflect;
import go.Syntax;

// HxDynamic implements Dynamic runtime manipulation required by Haxe
// using go.reflect.Reflect and naming from http://haxedev.wikidot.com/article:operator-overloading
// It is intended to be as permissive as possible, returning null or zero values
// when operations are invalid, rather than panicking.
// However it does put out warning messages that could be converted to Haxe throw statements.
// All functions return String, Int, Float, Bool or null inside a Dynamic
//
// TODO tests
@:keep
class HxDynamic {

	//
	// unary operations
	//

	public static function not(d:Dynamic):Bool {
		var dV = Reflect.valueOf(d);
		if (dV.kind() == Reflect.Bool) {
			var dB:Bool = dV.bool();
			return !dB;
		} else {
			throw "runtime.HxDynamic.not value invalid: " + Std.string(d);
		}
	}

	public static function increment(d:Dynamic):Dynamic {
		var dV = Reflect.valueOf(d);
		if (dV.canInt() || dV.canUint()) {
			return (valueToInt(dV) + 1 : Dynamic);
		} else if (dV.canFloat()) {
			return (valueToFloat(dV) + 1.0 : Dynamic);
		}
		Sys.println("throw runtime.HxDynamic.increment value invalid: " + Std.string(d));
		return (null : Dynamic);
	}

	public static function decrement(d:Dynamic):Dynamic {
		var dV = Reflect.valueOf(d);
		if (dV.canInt() || dV.canUint()) {
			return (valueToInt(dV) - 1 : Dynamic);
		} else if (dV.canFloat()) {
			return (valueToFloat(dV) - 1.0 : Dynamic);
		}
		Sys.println("throw runtime.HxDynamic.decrement value invalid: " + Std.string(d));
		return (null : Dynamic);
	}

	public static function negate(d:Dynamic):Dynamic {
		var dV = Reflect.valueOf(d);
		if (dV.canInt() || dV.canUint()) {
			return (0 - valueToInt(dV) : Dynamic);
		} else if (dV.canFloat()) {
			return (0.0 - valueToFloat(dV) : Dynamic);
		}
		Sys.println("throw runtime.HxDynamic.negate value invalid: " + Std.string(d));
		return (null : Dynamic);
	}

	public static function bitnot(d:Dynamic):Dynamic {
		var dV = Reflect.valueOf(d);
		if (dV.canInt() || dV.canUint()) {
			return (~valueToInt(dV) : Dynamic);
		}
		Sys.println("throw runtime.HxDynamic.bitnot value invalid: " + Std.string(d));
		return (null : Dynamic);
	}

	//
	// binary operations
	//

	public static function and(a:Dynamic, b:Dynamic):Bool {
		var aV = Reflect.valueOf(a);
		var bV = Reflect.valueOf(b);
		if (aV.kind() == Reflect.Bool && bV.kind() == Reflect.Bool)
			return aV.bool() && bV.bool();
		else
			throw "runtime.HxDynamic.and invalid operands: " + aV.string() + " and " + bV.string();
	}

	public static function or(a:Dynamic, b:Dynamic):Bool {
		var aV = Reflect.valueOf(a);
		var bV = Reflect.valueOf(b);
		if (aV.kind() == Reflect.Bool && bV.kind() == Reflect.Bool)
			return aV.bool() || bV.bool();
		else
			throw "throw runtime.HxDynamic.or invalid operands: " + aV.string() + " and " + bV.string();
	}

	// interal function for assessing what kind of operation to perform on comperable values
	static function jointKind(aV:Value, bV:Value):Kind {
		var avCi = aV.canInt() || aV.canUint();
		var bvCi = bV.canInt() || bV.canUint();
		if (avCi && bvCi)
			return Reflect.Int;
		else if ((aV.canFloat() || avCi) && (bV.canFloat() || bvCi))
			return Reflect.Float64;
		else if (aV.kind() == Reflect.String || bV.kind() == Reflect.String)
			return Reflect.String;
		else
			Sys.println("throw runtime.HxDynamic.jointKind invalid operands: " + aV.string() + " and " + bV.string());
		return Reflect.Invalid;
	}

	public static function isNull(x: Dynamic): Bool {
		return Syntax.code("{0} == nil", x); // this doesn't work: Reflect.valueOf(x).isNil();
	}

	public static function equals(a:Dynamic, b:Dynamic):Bool {
		// null == special case
		var aN = isNull(a);
		var bN = isNull(b);

		if (aN || bN) {
			if (aN && bN)
				return true;
			else
				return false; // null only ever equals null
		}

		var aV = Reflect.valueOf(a);
		var bV = Reflect.valueOf(b);
		var aK = aV.kind();
		var bK = bV.kind();

		// Bool == special case
		// Note: not promoting bool to int
		if (aK == Reflect.Bool || bK == Reflect.Bool) {
			if (aK == Reflect.Bool && bK == Reflect.Bool) {
				return aV.bool() == bV.bool();
			} else {
				return false; // bool only equal other bool
			}
		}

		var k = jointKind(aV, bV);
		if (k == Reflect.Int)
			return valueToInt(aV) == valueToInt(bV);
		else if (k == Reflect.Float64)
			return valueToFloat(aV) == valueToFloat(bV);
		else if (k == Reflect.String)
			return toString(a) == toString(b);
		else
			throw "Invalid equals on Dynamic";
	}

	public static function nequals(a:Dynamic, b:Dynamic):Bool {
		return !equals(a, b);
	}

	public static function lt(a:Dynamic, b:Dynamic):Bool {
		var aV = Reflect.valueOf(a);
		var bV = Reflect.valueOf(b);
		var k = jointKind(aV, bV);
		if (k == Reflect.Int)
			return valueToInt(aV) < valueToInt(bV);
		else if (k == Reflect.Float64)
			return valueToFloat(aV) < valueToFloat(bV);
		else if (k == Reflect.String)
			return toString(a) < toString(b);
		else
			throw "Invalid lt on Dynamic";
	}

	public static function gtequals(a:Dynamic, b:Dynamic):Bool {
		return !lt(a, b);
	}

	public static function gt(a:Dynamic, b:Dynamic):Bool {
		var aV = Reflect.valueOf(a);
		var bV = Reflect.valueOf(b);
		var k = jointKind(aV, bV);
		if (k == Reflect.Int)
			return valueToInt(aV) > valueToInt(bV);
		else if (k == Reflect.Float64)
			return valueToFloat(aV) > valueToFloat(bV);
		else if (k == Reflect.String)
			return toString(a) > toString(b);
		else
			throw "Invalid gt on Dynamic";
	}

	public static function ltequals(a:Dynamic, b:Dynamic):Bool {
		return !gt(a, b);
	}

	public static function add(a:Dynamic, b:Dynamic):Dynamic {
		var aV = Reflect.valueOf(a);
		var bV = Reflect.valueOf(b);
		var k = jointKind(aV, bV);
		if (k == Reflect.Int)
			return (valueToInt(aV) + valueToInt(bV) : Dynamic);
		else if (k == Reflect.Float64)
			return (valueToFloat(aV) + valueToFloat(bV) : Dynamic);
		else if (k == Reflect.String)
			return (toString(a) + toString(b):Dynamic);
		else
			return (null : Dynamic);
	}

	public static function subtract(a:Dynamic, b:Dynamic):Dynamic {
		var aV = Reflect.valueOf(a);
		var bV = Reflect.valueOf(b);
		var k = jointKind(aV, bV);
		if (k == Reflect.Int)
			return (valueToInt(aV) - valueToInt(bV) : Dynamic);
		else if (k == Reflect.Float64)
			return (valueToFloat(aV) - valueToFloat(bV) : Dynamic);
		else
			return (null : Dynamic);
	}

	public static function multiply(a:Dynamic, b:Dynamic):Dynamic {
		var aV = Reflect.valueOf(a);
		var bV = Reflect.valueOf(b);
		var k = jointKind(aV, bV);
		if (k == Reflect.Int)
			return (valueToInt(aV) * valueToInt(bV) : Dynamic);
		else if (k == Reflect.Float64)
			return (valueToFloat(aV) * valueToFloat(bV) : Dynamic);
		else
			return (null : Dynamic);
	}

	public static function divide(a:Dynamic, b:Dynamic):Dynamic {
		var aV = Reflect.valueOf(a);
		var bV = Reflect.valueOf(b);
		var k = jointKind(aV, bV);
		// In Haxe, the standard division operator (/) always produces a Float result, even if both operands are integers.
		if (k == Reflect.Int || k == Reflect.Float64)
			return (valueToFloat(aV) / valueToFloat(bV) : Dynamic);
		else
			return (null : Dynamic);
	}

	public static function modulo(a:Dynamic, b:Dynamic):Dynamic {
		var aV = Reflect.valueOf(a);
		var bV = Reflect.valueOf(b);
		var k = jointKind(aV, bV);
		// In Haxe, Float does not support modulo
		if (k == Reflect.Int)
			return (valueToInt(aV) % valueToInt(bV) : Dynamic);
		else
			return (null : Dynamic);
	}

	public static function bitand(a:Dynamic, b:Dynamic):Dynamic {
		var aV = Reflect.valueOf(a);
		var bV = Reflect.valueOf(b);
		var k = jointKind(aV, bV);
		if (k == Reflect.Int)
			return (valueToInt(aV) & valueToInt(bV) : Dynamic);
		else
			return (null : Dynamic);
	}

	public static function bitor(a:Dynamic, b:Dynamic):Dynamic {
		var aV = Reflect.valueOf(a);
		var bV = Reflect.valueOf(b);
		var k = jointKind(aV, bV);
		if (k == Reflect.Int)
			return (valueToInt(aV) | valueToInt(bV) : Dynamic);
		else
			return (null : Dynamic);
	}

	public static function bitxor(a:Dynamic, b:Dynamic):Dynamic {
		var aV = Reflect.valueOf(a);
		var bV = Reflect.valueOf(b);
		var k = jointKind(aV, bV);
		if (k == Reflect.Int)
			return (valueToInt(aV) ^ valueToInt(bV) : Dynamic);
		else
			return (null : Dynamic);
	}

	public static function lbitshift(a:Dynamic, b:Dynamic):Dynamic {
		var aV = Reflect.valueOf(a);
		var bV = Reflect.valueOf(b);
		var k = jointKind(aV, bV);
		if (k == Reflect.Int)
			return (valueToInt(aV) << valueToInt(bV) : Dynamic);
		else
			return (null : Dynamic);
	}

	public static function rbitshift(a:Dynamic, b:Dynamic):Dynamic {
		var aV = Reflect.valueOf(a);
		var bV = Reflect.valueOf(b);
		var k = jointKind(aV, bV);
		if (k == Reflect.Int)
			return (valueToInt(aV) >> valueToInt(bV) : Dynamic);
		else
			return (null : Dynamic);
	}

	public static function urbitshift(a:Dynamic, b:Dynamic):Dynamic {
		var aV = Reflect.valueOf(a);
		var bV = Reflect.valueOf(b);
		var k = jointKind(aV, bV);
		if (k == Reflect.Int)
			return (valueToInt(aV) >>> valueToInt(bV) : Dynamic);
		else
			return (null : Dynamic);
	}

	//
	// conversion functions, following Haxe Dynamic conventions
	//

	public static function toString(d:Dynamic):String {
		// var dV = Reflect.valueOf(d);
		// if (dV.kind() == Reflect.String) {
		// 	return dV.string(); // gives a string showing the type of the value, not a representation of the value
		// }
		return Std.string(d);
	}

	public static function toBool(d:Dynamic):Bool {
		var dV = Reflect.valueOf(d);
		if (dV.kind() == Reflect.Bool) {
			return dV.bool();
		}
		return valueToInt(dV) != 0;
	}

	// internal function to convert Value to Int
	static function valueToInt(dV:Value):Int {
		// NOTE not converting bool to int
		// if (dV.kind() == Reflect.Bool) {
		//  return if (dV.bool()) 1 else 0;
		// } else
		if (dV.canUint()) {
			return (dV.uint() : Int);
		} else if (dV.canInt()) {
			return (dV.int() : Int);
		} else if (dV.canFloat()) {
			return Math.round((dV.float() : Float)); // no right way to do this, round rather than floor
		}
		return 0;
	}

	public static function toInt(d:Dynamic):Int {
		var dV = Reflect.valueOf(d);
		return valueToInt(dV);
	}

	// internal function to convert Value to Float
	static function valueToFloat(dV:Value):Float {
		// NOTE not converting bool to int
		// if (dV.kind() == Reflect.Bool) {
		//  return if (dV.bool()) 1.0 else 0.0;
		// } else
		if (dV.canUint()) {
			return (dV.uint() : Float);
		} else if (dV.canInt()) {
			return (dV.int() : Float);
		} else if (dV.canFloat()) {
			return (dV.float() : Float);
		}
		return 0.0;
	}

	public static function toFloat(d:Dynamic):Float {
		var dV = Reflect.valueOf(d);
		return valueToFloat(dV);
	}
}
