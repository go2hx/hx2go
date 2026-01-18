import go.Go;
import go.Syntax;
import go.math.Rand;

@:pure
@:go.StaticAccess({ name: "math", imports: ["math"] })
extern class Math {

    static var PI(get, null):Float;
    static var NEGATIVE_INFINITY(get, null):Float;
    static var POSITIVE_INFINITY(get, null):Float;
    static var NaN(get, null):Float;

    @:native("Abs")
    static function abs(v:Float):Float;
    @:native("Min")
    static function min(a:Float, b:Float):Float;
    @:native("Max")
    static function max(a:Float, b:Float):Float;
    @:native("Sin")
    static function sin(v:Float):Float;
    @:native("Cos")
    static function cos(v:Float):Float;
    @:native("Tan")
    static function tan(v:Float):Float;
    @:native("Asin")
    static function asin(v:Float):Float;
    @:native("Acos")
    static function acos(v:Float):Float;
    @:native("Atan")
    static function atan(v:Float):Float;
    @:native("Atan2")
    static function atan2(y:Float, x:Float):Float;
    @:native("Exp")
    static function exp(v:Float):Float;
    @:native("Log")
    static function log(v:Float):Float;
    @:native("Pow")
    static function pow(v:Float, exp:Float):Float;
    @:native("Sqrt")
    static function sqrt(v:Float):Float;
    @:native("IsNaN")
    static function isNaN(f:Float):Bool;
    @:native("Floor")
    static function ffloor(v:Float):Float;
    @:native("Ceil")
    static function fceil(v:Float):Float;
    @:native("Round")
    static function fround(v:Float):Float;

    inline static function round(v:Float):Int
        return Go.int(fround(v));

    inline static function floor(v:Float):Int
        return Go.int(ffloor(v));

    inline static function ceil(v:Float):Int
        return Go.int(fceil(v));

    inline static function random():Float
        return Rand.float64();

    inline static function isFinite(f:Float):Bool
        return Syntax.code("!math.IsNaN({0}) && !math.IsInf({0}, 0)", f);

    inline static function get_PI():Float
        return 3.141592653589793;

    inline static function get_NEGATIVE_INFINITY():Float
        return Syntax.code("math.Inf(-1)");

    inline static function get_POSITIVE_INFINITY():Float
        return Syntax.code("math.Inf(1)");

    inline static function get_NaN():Float
        return Syntax.code("math.NaN()");

}
