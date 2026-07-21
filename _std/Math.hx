import go.Go;
import go.math.Rand;

@:pure
class Math {

    // Core type declares these as (default, null); initialise once rather than via getters.
    public static var PI(default, null): Float = go.Math.Pi;
    public static var NEGATIVE_INFINITY(default, null): Float = go.Math.inf(-1);
    public static var POSITIVE_INFINITY(default, null): Float = go.Math.inf(1);
    public static var NaN(default, null): Float = go.Math.naN();

    public static function abs(v: Float): Float {
        return go.Math.abs(v);
    }

    public static function min(a: Float, b: Float): Float {
        return go.Math.min(a, b);
    }

    public static function max(a: Float, b: Float): Float {
        return go.Math.max(a, b);
    }

    public static function sin(v: Float): Float {
        return go.Math.sin(v);
    }

    public static function cos(v: Float): Float {
        return go.Math.cos(v);
    }

    public static function tan(v: Float): Float {
        return go.Math.tan(v);
    }

    public static function asin(v: Float): Float {
        return go.Math.asin(v);
    }

    public static function acos(v: Float): Float {
        return go.Math.acos(v);
    }

    public static function atan(v: Float): Float {
        return go.Math.atan(v);
    }

    public static function atan2(y: Float, x: Float): Float {
        return go.Math.atan2(y, x);
    }

    public static function exp(v: Float): Float {
        return go.Math.exp(v);
    }

    public static function log(v: Float): Float {
        return go.Math.log(v);
    }

    public static function pow(v: Float, exp: Float): Float {
        return go.Math.pow(v, exp);
    }

    public static function sqrt(v: Float): Float {
        return go.Math.sqrt(v);
    }

    public static function isNaN(f: Float): Bool {
        return go.Math.isNaN(f);
    }

    public static function ffloor(v: Float): Float {
        return go.Math.floor(v);
    }

    public static function fceil(v: Float): Float {
        return go.Math.ceil(v);
    }

    public static function fround(v: Float): Float {
        return go.Math.round(v);
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
        return !go.Math.isNaN(f) && !go.Math.isInf(f, 0);
    }

}