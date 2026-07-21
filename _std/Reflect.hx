import go.Syntax;
import go.haxe.HxDynamic;

class Reflect {

    public static function hasField(o: Dynamic, field: String): Bool {
        throw "not implemented"; // TODO
    }

    public static function field(o: Dynamic, field: String): Dynamic {
        return HxDynamic.getField(o, field);
    }

    public static function setField(o: Dynamic, field: String, value: Dynamic): Void {
        throw "not implemented"; // TODO
    }

    public static function getProperty(o: Dynamic, field: String): Dynamic {
        throw "not implemented"; // TODO
    }

    public static function setProperty(o: Dynamic, field: String, value: Dynamic): Void {
        throw "not implemented"; // TODO
    }

    public static function callMethod(o: Dynamic, func: haxe.Constraints.Function, args: Array<Dynamic>): Dynamic {
        throw "not implemented"; // TODO
    }

    public static function fields(o: Dynamic): Array<String> {
        throw "not implemented"; // TODO
    }

    public static function isFunction(f: Dynamic): Bool {
        return go.Reflect.typeOf(f).kind() == Syntax.code("reflect.Func");
    }

    public static function compare<T>(a: T, b: T): Int {
        return (a == b) ? 0 : (((a : Dynamic) > (b : Dynamic)) ? 1 : -1);
    }

    public static function compareMethods(f1: Dynamic, f2: Dynamic): Bool {
        throw "not implemented"; // TODO
    }

    public static function isObject(v: Dynamic): Bool {
        throw "not implemented"; // TODO
    }

    public static function isEnumValue(v: Dynamic): Bool {
        throw "not implemented"; // TODO
    }

    public static function deleteField(o: Dynamic, field: String): Bool {
        throw "not implemented"; // TODO
    }

    public static function copy<T>(o: Null<T>): Null<T> {
        throw "not implemented"; // TODO
    }

    public static function makeVarArgs<T>(f: Array<Dynamic> -> T): Dynamic {
        throw "not implemented"; // TODO
    }

}
