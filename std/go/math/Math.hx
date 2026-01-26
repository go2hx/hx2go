package go.math;

import go.Float64;
import go.GoInt;

@:pure
@:go.TypeAccess({ name: "math", imports: ["math"] })
extern class Math {

    static var E: Float64;
    static var Pi: Float64;
    static var Phi: Float64;
    static var Sqrt2: Float64;
    static var SqrtE: Float64;
    static var SqrtPi: Float64;
    static var SqrtPhi: Float64;
    static var Ln2: Float64;
    static var Log2E: Float64;
    static var Ln10: Float64;
    static var Log10E: Float64;

    static function abs(x: Float64): Float64;
    static function acos(x: Float64): Float64;
    static function acosh(x: Float64): Float64;
    static function asin(x: Float64): Float64;
    static function asinh(x: Float64): Float64;
    static function atan(x: Float64): Float64;
    static function atan2(y: Float64, x: Float64): Float64;
    static function atanh(x: Float64): Float64;
    static function cbrt(x: Float64): Float64;
    static function ceil(x: Float64): Float64;
    static function copysign(f: Float64, sign: Float64): Float64;
    static function cos(x: Float64): Float64;
    static function cosh(x: Float64): Float64;
    static function dim(x: Float64, y: Float64): Float64;
    static function erf(x: Float64): Float64;
    static function erfc(x: Float64): Float64;
    static function erfcinv(x: Float64): Float64;
    static function erfinv(x: Float64): Float64;
    static function exp(x: Float64): Float64;
    static function exp2(x: Float64): Float64;
    static function expm1(x: Float64): Float64;
    static function FMA(x: Float64, y: Float64, z: Float64): Float64;
    static function float32bits(f: go.Float32): go.UInt32;
    static function float32frombits(b: go.UInt32): go.Float32;
    static function float64bits(f: Float64): go.UInt64;
    static function float64frombits(b: go.UInt64): Float64;
    static function floor(x: Float64): Float64;
    static function gamma(x: Float64): Float64;
    static function hypot(p: Float64, q: Float64): Float64;
    static function ilogb(x: Float64): GoInt;
    static function inf(sign: GoInt): Float64;
    static function isInf(f: Float64, sign: GoInt): Bool;
    static function isNaN(f: Float64): Bool;
    static function j0(x: Float64): Float64;
    static function j1(x: Float64): Float64;
    static function jn(n: GoInt, x: Float64): Float64;
    static function ldexp(frac: Float64, exp: GoInt): Float64;
    static function log(x: Float64): Float64;
    static function log10(x: Float64): Float64;
    static function log1p(x: Float64): Float64;
    static function log2(x: Float64): Float64;
    static function logb(x: Float64): Float64;
    static function max(x: Float64, y: Float64): Float64;
    static function min(x: Float64, y: Float64): Float64;
    static function mod(x: Float64, y: Float64): Float64;
    static function NaN(): Float64;
    static function nextafter(x: Float64, y: Float64): Float64;
    static function nextafter32(x: go.Float32, y: go.Float32): go.Float32;
    static function pow(x: Float64, y: Float64): Float64;
    static function pow10(n: GoInt): Float64;
    static function remainder(x: Float64, y: Float64): Float64;
    static function round(x: Float64): Float64;
    static function roundToEven(x: Float64): Float64;
    static function signbit(x: Float64): Bool;
    static function sin(x: Float64): Float64;
    static function sinh(x: Float64): Float64;
    static function sqrt(x: Float64): Float64;
    static function tan(x: Float64): Float64;
    static function tanh(x: Float64): Float64;
    static function trunc(x: Float64): Float64;
    static function y0(x: Float64): Float64;
    static function y1(x: Float64): Float64;
    static function yn(n: GoInt, x: Float64): Float64;
    static function frexp(f: Float64): Tuple<{ frac: Float64, exp: GoInt }>;
    static function lgamma(x: Float64): Tuple<{ lgamma: Float64, sign: GoInt }>;
    static function modf(f: Float64): Tuple<{ int: Float64, frac: Float64 }>;
    static function sincos(x: Float64): Tuple<{ sin: Float64, cos: Float64 }>;

}
