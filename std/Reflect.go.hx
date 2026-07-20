import go.Syntax;
import go.haxe.HxDynamic;

class Reflect {

    public static function compare<T>(a: T, b: T): Int {
        return (a == b) ? 0 : (((a : Dynamic) > (b : Dynamic)) ? 1 : -1);
    }

    public static function field(o: Dynamic, field: String): Dynamic {
        return HxDynamic.getField(o, field);
    }

    public static function fields<T>(a: T): Array<String> {
        // TODO
        throw "not implemented";
    }

    public static function setField<T>(a: T, f: String, e: Dynamic): Dynamic {
        // TODO
        throw "not implemented";
    }

    public static function isFunction<T>(v:T):Bool {
        return go.Reflect.typeOf(v).kind() == Syntax.code("reflect.Func");
    }

    public static function callMethod(o:Dynamic, func:Dynamic, args:Array<Dynamic>):Dynamic {
        throw "not implemented";
    }

    public static function compareMethods(f1:Dynamic, f2:Dynamic):Bool {
        throw "not implemented";
    }

}