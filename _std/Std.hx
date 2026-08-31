import go.Slice;
import go.Fmt;
import go.haxe.HxDynamic;
import go.Reflect;
import go.Go;
import go.haxe.HxEnumValue;
import go.haxe.HxEnum;
import go.Syntax;
import go.Strconv;
import go.haxe.HxClass;

class Std {

    public static function int(x: Float): Int {
        return Go.int32(x);
    }

    static inline function isSpaceChar(code:Int):Bool
		return (code > 8 && code < 14) || code == 32;

	static inline function isHexPrefix(cur:Int, next:Int):Bool
		return cur == '0'.code && (next == 'x'.code || next == 'X'.code);

	static inline function isDecimalDigit(code:Int):Bool
		return '0'.code <= code && code <= '9'.code;

	static inline function isHexadecimalDigit(code:Int):Bool
		return isDecimalDigit(code) || ('a'.code <= code && code <= 'f'.code) || ('A'.code <= code && code <= 'F'.code);

    public static function parseInt(x: String): Null<Int> {
        if (x == null)
			return null;

		final len = x.length;
		var index = 0;

		inline function hasIndex(index:Int)
			return index < len;

		// skip whitespace
		while (hasIndex(index)) {
			if (!isSpaceChar(x.charCodeAt(index)))
				break;
			++index;
		}

		// handle sign
		final isNegative = hasIndex(index) && {
			final sign = x.charCodeAt(index);
			if (sign == '-'.code || sign == '+'.code) {
				++index;
			}
			sign == '-'.code;
		}

		// handle base
		final isHexadecimal = hasIndex(index + 1) && isHexPrefix(x.charCodeAt(index), x.charCodeAt(index + 1));
		if (isHexadecimal)
			index += 2; // skip prefix

		// handle digits
		final firstInvalidIndex = {
			var cur = index;
			if (isHexadecimal) {
				while (hasIndex(cur)) {
					if (!isHexadecimalDigit(x.charCodeAt(cur)))
						break;
					++cur;
				}
			} else {
				while (hasIndex(cur)) {
					if (!isDecimalDigit(x.charCodeAt(cur)))
						break;
					++cur;
				}
			}
			cur;
		}

		// no valid digits
		if (index == firstInvalidIndex)
			return null;

		final result:Int = Strconv.parseInt(x.substring(index, firstInvalidIndex), if (isHexadecimal) 16 else 10, 32).sure();
		return if (isNegative) -result else result;
	}

    public static function parseFloat(x: String):Float {
        return Strconv.parseFloat(x, 64).sure();
    }

    public static function string(s: Dynamic): String {
        if (s == null) {
            return "null";
        }

        var value = HxDynamic.ensureConcreteValue(s);
        if (!value.isValid()) {
            return "null";
        }

        var kind = value.kind();
        if (kind == Reflect.ptr) {
            return string(value.elem());
        }

        if (kind == Reflect.map) {
            var buf = new StringBuf();
            var keys = value.mapKeys();

            if (keys.length > 0) {
                for (key in keys) {
                    if (key.kind() == Reflect.string) {
                        if (key.string() == "toString") {
                            return HxDynamic.call(value.mapIndex(key)._interface(), []);
                        }
                    }else{
                        break;
                    }
                }
            }

            buf.add('[');
            buf.add(keys.toArray().map(k -> '${k} => ${string(value.mapIndex(k))}').join(', '));
            buf.add(']');

            return buf.toString();
        }

        if (kind == Reflect.struct) {
            var enumIndexMethod = value.methodByName("Hx_Field_enumIndex");
            var enumTypeMethod = value.methodByName("Hx_Field_enumType");

            if (enumIndexMethod.isValid() && enumTypeMethod.isValid()) {
                var enumIndex: Int = enumIndexMethod.call([])[0]._interface();
                var enumType: HxEnum = enumTypeMethod.call([])[0]._interface();
                var enumCtorName: String = enumType.constructorNames[enumIndex];
                var enumCtorCount: Int = enumType.constructorArgCounts[enumIndex];
                var values: Array<String> = [];

                for (i in 0...value.numField()) {
                    values.push(string(value.field(i)));
                }

                return enumCtorCount == 0 ? enumCtorName : '${enumCtorName}(${values.join(",")})';
            }

            // Null<T> value types compile to a Go struct { Value T; Valid bool }; read those
            // raw Go fields via reflection (dynamic access would mangle them to Hx_Field_*).
            var valid = value.fieldByName("Valid");
            if (valid.isValid()) {
                var val = value.fieldByName("Value");
                return valid._interface() == false || !val.isValid() ? "null" : string(val._interface());
            }

            var vt = value.fieldByName("VTable");
            if (vt.isValid()) {
                var toStr = vt.methodByName("Hx_Field_toString");
                if (toStr.isValid()) {
                    return string(toStr.call([])[0]);
                }
            }

            return Fmt.sprintf("%v", value._interface());
        }

        if (kind == Reflect._interface && value.isNil()) {
            return "null";
        }

        return Fmt.sprintf("%v", value._interface());
    }

    public static function isOfType(v: Dynamic, t: Dynamic): Bool {
        var vt = std.Type.typeof(v);
        // TODO: finish impl
        switch t {
            case Int:
                return vt == TInt;
            case Float:
                return vt == TFloat;
            case Bool:
                return vt == TBool;
            case String:
                return vt.match(TClass(String));
            case Array:
                return vt.match(TClass(Array));
            case _: return switch vt {
                case TClass(q): {
                    var target: HxClass = cast t;
                    var queue: Array<HxClass> = [(cast q : HxClass)];

                    while (queue.length > 0) {
                        var current = queue.shift();
                        if (current.name == target.name) {
                            return true;
                        }

                        if (current.superClass != null) {
                            queue.push(current.superClass);
                        }

                        for (iface in current.interfaces) {
                            queue.push(iface);
                        }
                    }

                    return false;
                };

                case TEnum(q): {
                    var v1: HxEnum = cast t;
                    var v2: HxEnum = cast q;
                    v1.name == v2.name;
                }

                case _: false;
            }
        }

        return false;
    }

    public static function downcast<T:{}, S:T>(value: T, c: Class<S>): Null<S> {
        return isOfType(value, c) ? (cast value) : null;
    }

    @:deprecated('Std.is is deprecated. Use Std.isOfType instead.')
    public static function is(v: Dynamic, t: Dynamic): Bool {
        return isOfType(v, t);
    }

    @:deprecated('Std.instance() is deprecated. Use Std.downcast() instead.')
    public static function instance<T:{}, S:T>(value: T, c: Class<S>): Null<S> {
        return downcast(value, c);
    }

    public static function random(x: Int): Int {
        return x <= 0 ? 0 : int(Math.random() * x);
    }

}
