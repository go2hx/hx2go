import go.Fmt;
import go.haxe.HxDynamic;
import go.Reflect;
import go.haxe.HxArray;
import go.Go;
import go.haxe.HxEnumValue;
import go.haxe.HxEnum;
import go.Syntax;
import go.Strconv;

class Std {

    public static function int(x: Float): Int {
        return Go.int(x);
    }

    public static function parseInt(x: String):Int {
        return Strconv.atoi(x).sure();
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
        if (kind == Reflect.Ptr) {
            return string(value.elem());
        }

        if (kind == Reflect.Array || kind == Reflect.Slice) {
            var buf = new StringBuf();

            buf.add('[');
            buf.add(HxArray.map(value._interface(), string).join(","));
            buf.add(']');

            return buf.toString();
        }

        if (kind == Reflect.Map) {
            var buf = new StringBuf();
            var keys = value.mapKeys();

            buf.add('[');
            buf.add(keys.toArray().map(k -> '${k} => ${string(value.mapIndex(k))}').join(', '));
            buf.add(']');

            return buf.toString();
        }

        if (kind == Reflect.Struct) {
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

        if (kind == Reflect.Interface && value.isNil()) {
            return "null";
        }

        return Fmt.sprintf("%v", value._interface());
    }

    public static function isOfType(v: Dynamic, t: Dynamic): Bool {
        var vt = std.Type.typeof(v);
        // TODO: finish impl
        switch t {
            // case Int:
            //     return vt == TInt;
            // case Float:
            //     return vt == TFloat;
            // case Bool:
            //     return vt == TBool;
            case String:
                return vt.match(TClass(String));
            case Array:
                return vt.match(TClass(Array));
            case Class:
                return vt == t;
            default:
                trace(t);
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