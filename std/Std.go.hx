import go.fmt.Fmt;
import go.haxe.HxDynamic;
import go.reflect.Reflect;
import go.haxe.HxArray;
import go.Go;
import go.haxe.HxEnumValue;
import go.haxe.HxEnum;
import go.Syntax;
import go.strconv.Strconv;

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
            buf.add(HxArray.map(value.iface(), string).join(","));
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
                var enumIndex: Int = enumIndexMethod.call([])[0].iface();
                var enumType: HxEnum = enumTypeMethod.call([])[0].iface();
                var enumCtorName: String = enumType.constructorNames[enumIndex];
                var enumCtorCount: Int = enumType.constructorArgCounts[enumIndex];
                var values: Array<String> = [];

                for (i in 0...value.numField()) {
                    values.push(string(value.field(i)));
                }

                return enumCtorCount == 0 ? enumCtorName : '${enumCtorName}(${values.join(",")})';
            }

            var v = value.iface();

            var valid = HxDynamic.ensureValue(v.Valid);
            if (valid.isValid()) {
                return valid.iface() == false || !HxDynamic.ensureValue(v.Value).isValid() ? "null" : string(v.Value);
            }

            var vt = value.fieldByName("VTable");
            if (vt.isValid()) {
                var toStr = vt.methodByName("Hx_Field_toString");
                if (toStr.isValid()) {
                    return string(toStr.call([])[0]);
                }
            }

            return Fmt.sprintf("%v", value.iface());
        }

        if (kind == Reflect.Interface && value.isNil()) {
            return "null";
        }

        return Fmt.sprintf("%v", value.iface());
    }

    public static function isOfType(v: Dynamic, t: Dynamic): Bool {
        return false; // TODO: impl
    }

}