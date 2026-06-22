import go.Go;
import go.math.Rand;

@:pure
class Math {

    public static var PI(get, null): Float;
    public static var NEGATIVE_INFINITY(get, null): Float;
    public static var POSITIVE_INFINITY(get, null): Float;
    public static var NaN(get, null): Float;

    public static function abs(v: Float): Float {
        return go.math.Math.abs(v);
    }

    public static function min(a: Float, b: Float): Float {
        return go.math.Math.min(a, b);
    }

    public static function max(a: Float, b: Float): Float {
        return go.math.Math.max(a, b);
    }

    public static function sin(v: Float): Float {
        return go.math.Math.sin(v);
    }

    public static function cos(v: Float): Float {
        return go.math.Math.cos(v);
    }

    public static function tan(v: Float): Float {
        return go.math.Math.tan(v);
    }

    public static function asin(v: Float): Float {
        return go.math.Math.asin(v);
    }

    public static function acos(v: Float): Float {
        return go.math.Math.acos(v);
    }

    public static function atan(v: Float): Float {
        return go.math.Math.atan(v);
    }

    public static function atan2(y: Float, x: Float): Float {
        return go.math.Math.atan2(y, x);
    }

    public static function exp(v: Float): Float {
        return go.math.Math.exp(v);
    }

    public static function log(v: Float): Float {
        return go.math.Math.log(v);
    }

    public static function pow(v: Float, exp: Float): Float {
        return go.math.Math.pow(v, exp);
    }

    public static function sqrt(v: Float): Float {
        return go.math.Math.sqrt(v);
    }

    public static function isNaN(f: Float): Bool {
        return go.math.Math.isNaN(f);
    }

    public static function ffloor(v: Float): Float {
        return go.math.Math.floor(v);
    }

    public static function fceil(v: Float): Float {
        return go.math.Math.ceil(v);
    }

    public static function fround(v: Float): Float {
        return go.math.Math.round(v);
    }

    public static function round(v: Float): Int {
        return Go.int(fround(v));
    }

    public static function floor(v: Float): Int {
        return Go.int(ffloor(v));
    }

    public static function ceil(v: Float): Int {
        return Go.int(fceil(v));
    }

    public static function random(): Float {
        return Rand.float64();
    }

    public static function isFinite(f: Float): Bool {
        return !go.math.Math.isNaN(f) && !go.math.Math.isInf(f, 0);
    }

    private static function get_PI(): Float {
        return go.math.Math.Pi;
    }

    private static function get_NEGATIVE_INFINITY(): Float {
        return go.math.Math.inf(-1);
    }

    private static function get_POSITIVE_INFINITY(): Float {
        return go.math.Math.inf(1);
    }

    private static function get_NaN(): Float {
        return go.math.Math.NaN();
    }

}