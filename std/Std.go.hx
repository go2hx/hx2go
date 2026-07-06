import go.fmt.Fmt;
import go.hx2go.HxDynamic;
import go.reflect.Reflect;
import go.hx2go.HxArray;

class Std {

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
            var v = value.iface();

            var valid = HxDynamic.ensureValue(v.Valid);
            if (!valid.isValid() || valid.iface() == false) {
                return "null";
            }

            var inner = HxDynamic.ensureValue(v.Value);
            if (!inner.isValid()) {
                return "null";
            }

            return string(inner.iface());
        }

        if (kind == Reflect.Interface && value.isNil()) {
            return "null";
        }

        return Fmt.sprintf("%v", value.iface());
    }
}