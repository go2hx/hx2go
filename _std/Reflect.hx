import go.Syntax;
import go.haxe.HxDynamic;

class Reflect {

    public static function hasField(o: Dynamic, field: String): Bool {
        return Reflect.fields(o).indexOf(field) != -1;
    }

    public static function field(o: Dynamic, field: String): Dynamic {
        return HxDynamic.getField(o, field);
    }

    public static function setField(o: Dynamic, field: String, value: Dynamic): Void {
        HxDynamic.setField(o, field, value);
    }

    public static function getProperty(o: Dynamic, field: String): Dynamic {
        throw "not implemented"; // TODO
    }

    public static function setProperty(o: Dynamic, field: String, value: Dynamic): Void {
        throw "not implemented"; // TODO
    }

    public static function callMethod(o: Dynamic, func: haxe.Constraints.Function, args: Array<Dynamic>): Dynamic {
        return HxDynamic.call(func, args);
    }

    public static function fields(o: Dynamic): Array<String> {
        var value = HxDynamic.ensureConcreteValue(o);
        if (!value.isValid()) {
            return [];
        }

        var kind = value.kind();
        if (kind == go.Reflect.Ptr || kind == go.Reflect.Interface) {
            if (value.isNil()) {
                return [];
            }

            value = value.elem();
            kind = value.kind();
        }

        if (kind == go.Reflect.Map) {
            var keys = value.mapKeys();
            return keys.toArray().map(k -> Std.string(k));
        }

        // TODO: according to spec this function is only guarenteed to work for anon objects, but it would be nice to support classes too.

        return [];
    }

    public static function isFunction(f: Dynamic): Bool {
        return go.Reflect.typeOf(f).kind() == go.Reflect.Func;
    }

    public static function compare<T>(a: T, b: T): Int {
        return (a == b) ? 0 : (((a : Dynamic) > (b : Dynamic)) ? 1 : -1);
    }

    public static function compareMethods(f1: Dynamic, f2: Dynamic): Bool {
        if (f1 == null || f2 == null) {
            return false;
        }

        throw f1 == f2;
    }

    public static function isObject(v: Dynamic): Bool {
        var value = HxDynamic.ensureConcreteValue(v);
        if (!value.isValid()) {
            return false;
        }

        if (v == null || isEnumValue(value)) {
            return false;
        }

        var kind = value.kind();
        if (kind == go.Reflect.Ptr || kind == go.Reflect.Interface) {
            if (value.isNil()) {
                return false;
            }

            value = value.elem();
            kind = value.kind();
        }

        var type = value.type();
        return (kind == go.Reflect.Struct) || (kind == go.Reflect.Map && type.key().kind() == go.Reflect.String && type.elem().kind() == go.Reflect.Interface);
    }

    public static function isEnumValue(v: Dynamic): Bool {
        var value = HxDynamic.ensureConcreteValue(v);
        if (!value.isValid()) {
            return false;
        }

        var enumIndexMethod = value.methodByName("Hx_Field_enumIndex");
        var enumTypeMethod = value.methodByName("Hx_Field_enumType");

        return enumIndexMethod.isValid() && enumTypeMethod.isValid();
    }

    public static function deleteField(o: Dynamic, field: String): Bool {
        var value = HxDynamic.ensureConcreteValue(o);
        if (!value.isValid()) {
            return false;
        }

        var kind = value.kind();
        if (kind == go.Reflect.Ptr || kind == go.Reflect.Interface) {
            if (value.isNil()) {
                return false;
            }

            value = value.elem();
            kind = value.kind();
        }

        if (kind == go.Reflect.Map) {
            var kt = value.type().key();
            if (kt.kind() != go.Reflect.String) {
                return false;
            }

            var kv = go.Reflect.valueOf(field);
            value.setMapIndex(kv, go.Reflect.valueOf(null));

            return true;
        }

        return false;
    }

    public static function copy<T>(o: Null<T>): Null<T> {
        var value = HxDynamic.ensureConcreteValue(o);
        if (!value.isValid()) {
            return null;
        }

        var kind = value.kind();
        if (kind == go.Reflect.Ptr || kind == go.Reflect.Interface) {
            if (value.isNil()) {
                return null;
            }

            value = value.elem();
            kind = value.kind();
        }

        if (kind == go.Reflect.Map) {
            var mt = value.type();
            if (mt.key().kind() != go.Reflect.String || mt.elem().kind() != go.Reflect.Interface) {
                return null;
            }

            var newMap = go.Reflect.makeMap(mt);
            var keys = value.mapKeys();
            for (key in keys) {
                var v = value.mapIndex(key);
                newMap.setMapIndex(key, v);
            }

            return newMap._interface();
        }

        throw "o is not an anon struct";
    }

    public static function makeVarArgs<T>(f: Array<Dynamic> -> T): Dynamic {
        throw "not implemented"; // TODO
    }

}
