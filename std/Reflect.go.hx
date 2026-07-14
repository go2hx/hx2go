import go.haxe.HxDynamic;

class Reflect {

    public static function compare<T>(a: T, b: T): Int {
        return (a == b) ? 0 : (((a : Dynamic) > (b : Dynamic)) ? 1 : -1);
    }

}