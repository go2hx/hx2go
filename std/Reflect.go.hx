/**
	The Reflect API is a way to manipulate values dynamically through an
	abstract interface in an untyped manner. Use with care.

	@see https://haxe.org/manual/std-reflection.html
**/

import go.reflect.Reflect;

class Reflect {
	/**
		Tells if structure `o` has a field named `field`.

		This is only guaranteed to work for anonymous structures. Refer to
		`Type.getInstanceFields` for a function supporting class instances.

		If `o` or `field` are null, the result is unspecified.
	**/
	public static function hasField(o:Dynamic, field:String):Bool {
		var flds = fields(o);
		return flds.contains(field);
	}

	/**
		Returns the value of the field named `field` on object `o`.

		If `o` is not an object or has no field named `field`, the result is
		null.

		If the field is defined as a property, its accessors are ignored. Refer
		to `Reflect.getProperty` for a function supporting property accessors.

		If `field` is null, the result is unspecified.
	**/
	public static function field(o:Dynamic, field:String):Dynamic {
		var oV = go.reflect.Reflect.valueOf(o);
		var oK = oV.kind();
		if (oK == go.reflect.Reflect.Map) {
			// assume it is map[string]any
			return oV.mapIndex(go.reflect.Reflect.valueOf(field)).iface();
		} else if (oK == go.reflect.Reflect.Struct) {
			// TODO
		}
		return null;
	}

	/**
		Sets the field named `field` of object `o` to value `value`.

		If `o` has no field named `field`, this function is only guaranteed to
		work for anonymous structures.

		If `o` or `field` are null, the result is unspecified.
	**/
	public static function setField(o:Dynamic, field:String, value:Dynamic):Void {
		var oV = go.reflect.Reflect.valueOf(o);
		var oK = oV.kind();
		if (oK == go.reflect.Reflect.Map) {
			// assume it is map[string]any
			oV.setMapIndex(go.reflect.Reflect.valueOf(field), go.reflect.Reflect.valueOf(value));
		} else if (oK == go.reflect.Reflect.Struct) {
			// TODO
		}
	}

	/**
		Returns the value of the field named `field` on object `o`, taking
		property getter functions into account.

		If the field is not a property, this function behaves like
		`Reflect.field`, but might be slower.

		If `o` or `field` are null, the result is unspecified.
	**/
	public static function getProperty(o:Dynamic, field:String):Dynamic {
		// TODO
		return null;
	}

	/**
		Sets the field named `field` of object `o` to value `value`, taking
		property setter functions into account.

		If the field is not a property, this function behaves like
		`Reflect.setField`, but might be slower.

		If `field` is null, the result is unspecified.
	**/
	public static function setProperty(o:Dynamic, field:String, value:Dynamic):Void {
		// TODO
	}

	/**
		Call a method `func` with the given arguments `args`.

		The object `o` is ignored in most cases. It serves as the `this`-context in the following
		situations:

		* (neko) Allows switching the context to `o` in all cases.
		* (macro) Same as neko for Haxe 3. No context switching in Haxe 4.
		* (js, lua) Require the `o` argument if `func` does not, but should have a context.
			This can occur by accessing a function field natively, e.g. through `Reflect.field`
			or by using `(object : Dynamic).field`. However, if `func` has a context, `o` is
			ignored like on other targets.
	**/
	// TODO go2hx does not currently handle func:haxe.Constraints.Function correctly
	// public static function callMethod(o:Dynamic, func:haxe.Constraints.Function, args:Array<Dynamic>):Dynamic {
	//  // TODO
	//  return null;
	// }

	/**
		Returns the fields of structure `o`.

		This method is only guaranteed to work on anonymous structures. Refer to
		`Type.getInstanceFields` for a function supporting class instances.

		If `o` is null, the result is unspecified.
	**/
	public static function fields(o:Dynamic):Array<String> {
		var ret:Array<String> = [];
		var oV = go.reflect.Reflect.valueOf(o);
		var oK = oV.kind();
		if (oK == go.reflect.Reflect.Map) {
			// assume it is map[string]any
			var goNames = oV.mapKeys();
			var i:go.GoInt = 0;
			while (i < goNames.length) {
				ret.push(goNames[i++].string());
			}
		} else if (oK == go.reflect.Reflect.Struct) {
			// TODO
		}
		return ret;
	}

	/**
		Returns true if `f` is a function, false otherwise.

		If `f` is null, the result is false.
	**/
	public static function isFunction(f:Dynamic):Bool {
		return go.reflect.Reflect.typeOf(f).kind() == go.reflect.Reflect.Func;
	}

	/**
		Compares `a` and `b`.

		If `a` is less than `b`, the result is negative. If `b` is less than
		`a`, the result is positive. If `a` and `b` are equal, the result is 0.

		This function is only defined if `a` and `b` are of the same type.

		If that type is a function, the result is unspecified and
		`Reflect.compareMethods` should be used instead.

		For all other types, the result is 0 if `a` and `b` are equal. If they
		are not equal, the result depends on the type and is negative if:

		- Numeric types: a is less than b
		- String: a is lexicographically less than b
		- Other: unspecified

		If `a` and `b` are null, the result is 0. If only one of them is null,
		the result is unspecified.
	**/
	// TODO wait for hx2go generics to become stable
	// public static function compare<T>(a:T, b:T):Int {
	//  // TODO
	//  return 0;
	// }

	/**
		Compares the functions `f1` and `f2`.

		If `f1` or `f2` are null, the result is false.
		If `f1` or `f2` are not functions, the result is unspecified.

		Otherwise the result is true if `f1` and the `f2` are physically equal,
		false otherwise.

		If `f1` or `f2` are member method closures, the result is true if they
		are closures of the same method on the same object value, false otherwise.
	**/
	public static function compareMethods(f1:Dynamic, f2:Dynamic):Bool {
		// TODO
		return false;
	}

	/**
		Tells if `v` is an object.

		The result is true if `v` is one of the following:

		- class instance
		- structure
		- `Class<T>`
		- `Enum<T>`

		Otherwise, including if `v` is null, the result is false.
	**/
	public static function isObject(v:Dynamic):Bool {
		// TODO
		return false;
	}

	/**
		Tells if `v` is an enum value.

		The result is true if `v` is of type EnumValue, i.e. an enum
		constructor.

		Otherwise, including if `v` is null, the result is false.
	**/
	public static function isEnumValue(v:Dynamic):Bool {
		// TODO
		return false;
	}

	/**
		Removes the field named `field` from structure `o`.

		This method is only guaranteed to work on anonymous structures.

		If `o` or `field` are null, the result is unspecified.
	**/
	public static function deleteField(o:Dynamic, field:String):Bool {
		var oV = go.reflect.Reflect.valueOf(o);
		var oK = oV.kind();
		if (oK == go.reflect.Reflect.Map) {
			// assume it is map[string]any
			setField(o, field, null); // null value removes the field in go.Reflect
			return true;
		} else if (oK == go.reflect.Reflect.Struct) {
			// TODO
		}
		return false;
	}

	/**
		Copies the fields of structure `o`.

		This is only guaranteed to work on anonymous structures.

		If `o` is null, the result is `null`.
	**/
	// TODO wait for hx2go generics to become stable
	// public static function copy<T>(o:Null<T>):Null<T> {
	//  // TODO
	//  return null;
	// }
	// place-holder below
	public static function copy(o:Dynamic):Dynamic {
		var oV = go.reflect.Reflect.valueOf(o);
		var oK = oV.kind();
		if (oK == go.reflect.Reflect.Map) {
			// assume it is map[string]any
			// this presumes we are dealing with an anonymous structure
			var cpy = {};
			var goNames = oV.mapKeys();
			var i:go.GoInt = 0;
			while (i < goNames.length) {
				var fName = goNames[i++].string();
				setField(cpy, fName, field(o, fName));
			}
			return (cpy : Dynamic);
		} else if (oK == go.reflect.Reflect.Struct) {
			// TODO
		}
		return null;
	}

	/**
		Transform a function taking an array of arguments into a function that can
		be called with any number of arguments.
	**/
	// TODO wait for hx2go generics to become stable
	// public static function makeVarArgs<T>(f:Array<Dynamic>->T):Dynamic {
	//  // TODO
	//  return null;
	// }
}
