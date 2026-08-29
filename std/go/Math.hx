package go;

/**
    Package math provides basic constants and mathematical functions.
    
    This package does not guarantee bit-identical results across architectures.
**/
@:go.Type({ name: "math", instanceName: "math.math", imports: ["math"] })
extern class Math {

    /**
        Mathematical constants.
    **/
    @:native("E") static var E: Float;
    /**
        Mathematical constants.
    **/
    @:native("Ln10") static var ln10: Float;
    /**
        Mathematical constants.
    **/
    @:native("Ln2") static var ln2: Float;
    /**
        Mathematical constants.
    **/
    @:native("Log10E") static var log10E: Float;
    /**
        Mathematical constants.
    **/
    @:native("Log2E") static var log2E: Float;
    /**
        Floating-point limit values.
        Max is the largest finite value representable by the type.
        SmallestNonzero is the smallest positive, non-zero value representable by the type.
    **/
    @:native("MaxFloat32") static var maxFloat32: Float;
    /**
        Floating-point limit values.
        Max is the largest finite value representable by the type.
        SmallestNonzero is the smallest positive, non-zero value representable by the type.
    **/
    @:native("MaxFloat64") static var maxFloat64: Float;
    /**
        Integer limit values.
    **/
    @:native("MaxInt") static var maxInt: go.GoInt;
    /**
        Integer limit values.
    **/
    @:native("MaxInt16") static var maxInt16: go.GoInt;
    /**
        Integer limit values.
    **/
    @:native("MaxInt32") static var maxInt32: go.GoInt;
    /**
        Integer limit values.
    **/
    @:native("MaxInt64") static var maxInt64: go.GoInt;
    /**
        Integer limit values.
    **/
    @:native("MaxInt8") static var maxInt8: go.GoInt;
    /**
        Integer limit values.
    **/
    @:native("MaxUint") static var maxUint: go.GoInt;
    /**
        Integer limit values.
    **/
    @:native("MaxUint16") static var maxUint16: go.GoInt;
    /**
        Integer limit values.
    **/
    @:native("MaxUint32") static var maxUint32: go.GoInt;
    /**
        Integer limit values.
    **/
    @:native("MaxUint64") static var maxUint64: go.GoInt;
    /**
        Integer limit values.
    **/
    @:native("MaxUint8") static var maxUint8: go.GoInt;
    /**
        Integer limit values.
    **/
    @:native("MinInt") static var minInt: go.GoInt;
    /**
        Integer limit values.
    **/
    @:native("MinInt16") static var minInt16: go.GoInt;
    /**
        Integer limit values.
    **/
    @:native("MinInt32") static var minInt32: go.GoInt;
    /**
        Integer limit values.
    **/
    @:native("MinInt64") static var minInt64: go.GoInt;
    /**
        Integer limit values.
    **/
    @:native("MinInt8") static var minInt8: go.GoInt;
    /**
        Mathematical constants.
    **/
    @:native("Phi") static var phi: Float;
    /**
        Mathematical constants.
    **/
    @:native("Pi") static var pi: Float;
    /**
        Floating-point limit values.
        Max is the largest finite value representable by the type.
        SmallestNonzero is the smallest positive, non-zero value representable by the type.
    **/
    @:native("SmallestNonzeroFloat32") static var smallestNonzeroFloat32: Float;
    /**
        Floating-point limit values.
        Max is the largest finite value representable by the type.
        SmallestNonzero is the smallest positive, non-zero value representable by the type.
    **/
    @:native("SmallestNonzeroFloat64") static var smallestNonzeroFloat64: Float;
    /**
        Mathematical constants.
    **/
    @:native("Sqrt2") static var sqrt2: Float;
    /**
        Mathematical constants.
    **/
    @:native("SqrtE") static var sqrtE: Float;
    /**
        Mathematical constants.
    **/
    @:native("SqrtPhi") static var sqrtPhi: Float;
    /**
        Mathematical constants.
    **/
    @:native("SqrtPi") static var sqrtPi: Float;

    /**
        Abs returns the absolute value of x.
        
        Special cases are:
        
        	Abs(±Inf) = +Inf
        	Abs(NaN) = NaN
    **/
    @:native("Abs") static function abs(x: Float): (Float);
    /**
        Acos returns the arccosine, in radians, of x.
        
        Special case is:
        
        	Acos(x) = NaN if x < -1 or x > 1
    **/
    @:native("Acos") static function acos(x: Float): (Float);
    /**
        Acosh returns the inverse hyperbolic cosine of x.
        
        Special cases are:
        
        	Acosh(+Inf) = +Inf
        	Acosh(x) = NaN if x < 1
        	Acosh(NaN) = NaN
    **/
    @:native("Acosh") static function acosh(x: Float): (Float);
    /**
        Asin returns the arcsine, in radians, of x.
        
        Special cases are:
        
        	Asin(±0) = ±0
        	Asin(x) = NaN if x < -1 or x > 1
    **/
    @:native("Asin") static function asin(x: Float): (Float);
    /**
        Asinh returns the inverse hyperbolic sine of x.
        
        Special cases are:
        
        	Asinh(±0) = ±0
        	Asinh(±Inf) = ±Inf
        	Asinh(NaN) = NaN
    **/
    @:native("Asinh") static function asinh(x: Float): (Float);
    /**
        Atan returns the arctangent, in radians, of x.
        
        Special cases are:
        
        	Atan(±0) = ±0
        	Atan(±Inf) = ±Pi/2
    **/
    @:native("Atan") static function atan(x: Float): (Float);
    /**
        Atan2 returns the arc tangent of y/x, using
        the signs of the two to determine the quadrant
        of the return value.
        
        Special cases are (in order):
        
        	Atan2(y, NaN) = NaN
        	Atan2(NaN, x) = NaN
        	Atan2(+0, x>=0) = +0
        	Atan2(-0, x>=0) = -0
        	Atan2(+0, x<=-0) = +Pi
        	Atan2(-0, x<=-0) = -Pi
        	Atan2(y>0, 0) = +Pi/2
        	Atan2(y<0, 0) = -Pi/2
        	Atan2(+Inf, +Inf) = +Pi/4
        	Atan2(-Inf, +Inf) = -Pi/4
        	Atan2(+Inf, -Inf) = 3Pi/4
        	Atan2(-Inf, -Inf) = -3Pi/4
        	Atan2(y, +Inf) = 0
        	Atan2(y>0, -Inf) = +Pi
        	Atan2(y<0, -Inf) = -Pi
        	Atan2(+Inf, x) = +Pi/2
        	Atan2(-Inf, x) = -Pi/2
    **/
    @:native("Atan2") static function atan2(y: Float, x: Float): (Float);
    /**
        Atanh returns the inverse hyperbolic tangent of x.
        
        Special cases are:
        
        	Atanh(1) = +Inf
        	Atanh(±0) = ±0
        	Atanh(-1) = -Inf
        	Atanh(x) = NaN if x < -1 or x > 1
        	Atanh(NaN) = NaN
    **/
    @:native("Atanh") static function atanh(x: Float): (Float);
    /**
        Cbrt returns the cube root of x.
        
        Special cases are:
        
        	Cbrt(±0) = ±0
        	Cbrt(±Inf) = ±Inf
        	Cbrt(NaN) = NaN
    **/
    @:native("Cbrt") static function cbrt(x: Float): (Float);
    /**
        Ceil returns the least integer value greater than or equal to x.
        
        Special cases are:
        
        	Ceil(±0) = ±0
        	Ceil(±Inf) = ±Inf
        	Ceil(NaN) = NaN
    **/
    @:native("Ceil") static function ceil(x: Float): (Float);
    /**
        Copysign returns a value with the magnitude of f
        and the sign of sign.
    **/
    @:native("Copysign") static function copysign(f: Float, sign: Float): (Float);
    /**
        Cos returns the cosine of the radian argument x.
        
        Special cases are:
        
        	Cos(±Inf) = NaN
        	Cos(NaN) = NaN
    **/
    @:native("Cos") static function cos(x: Float): (Float);
    /**
        Cosh returns the hyperbolic cosine of x.
        
        Special cases are:
        
        	Cosh(±0) = 1
        	Cosh(±Inf) = +Inf
        	Cosh(NaN) = NaN
    **/
    @:native("Cosh") static function cosh(x: Float): (Float);
    /**
        Dim returns the maximum of x-y or 0.
        
        Special cases are:
        
        	Dim(+Inf, +Inf) = NaN
        	Dim(-Inf, -Inf) = NaN
        	Dim(x, NaN) = Dim(NaN, x) = NaN
    **/
    @:native("Dim") static function dim(x: Float, y: Float): (Float);
    /**
        Erf returns the error function of x.
        
        Special cases are:
        
        	Erf(+Inf) = 1
        	Erf(-Inf) = -1
        	Erf(NaN) = NaN
    **/
    @:native("Erf") static function erf(x: Float): (Float);
    /**
        Erfc returns the complementary error function of x.
        
        Special cases are:
        
        	Erfc(+Inf) = 0
        	Erfc(-Inf) = 2
        	Erfc(NaN) = NaN
    **/
    @:native("Erfc") static function erfc(x: Float): (Float);
    /**
        Erfcinv returns the inverse of [Erfc](x).
        
        Special cases are:
        
        	Erfcinv(0) = +Inf
        	Erfcinv(2) = -Inf
        	Erfcinv(x) = NaN if x < 0 or x > 2
        	Erfcinv(NaN) = NaN
    **/
    @:native("Erfcinv") static function erfcinv(x: Float): (Float);
    /**
        Erfinv returns the inverse error function of x.
        
        Special cases are:
        
        	Erfinv(1) = +Inf
        	Erfinv(-1) = -Inf
        	Erfinv(x) = NaN if x < -1 or x > 1
        	Erfinv(NaN) = NaN
    **/
    @:native("Erfinv") static function erfinv(x: Float): (Float);
    /**
        Exp returns e**x, the base-e exponential of x.
        
        Special cases are:
        
        	Exp(+Inf) = +Inf
        	Exp(NaN) = NaN
        
        Very large values overflow to 0 or +Inf.
        Very small values underflow to 1.
    **/
    @:native("Exp") static function exp(x: Float): (Float);
    /**
        Exp2 returns 2**x, the base-2 exponential of x.
        
        Special cases are the same as [Exp].
    **/
    @:native("Exp2") static function exp2(x: Float): (Float);
    /**
        Expm1 returns e**x - 1, the base-e exponential of x minus 1.
        It is more accurate than [Exp](x) - 1 when x is near zero.
        
        Special cases are:
        
        	Expm1(+Inf) = +Inf
        	Expm1(-Inf) = -1
        	Expm1(NaN) = NaN
        
        Very large values overflow to -1 or +Inf.
    **/
    @:native("Expm1") static function expm1(x: Float): (Float);
    /**
        FMA returns x * y + z, computed with only one rounding.
        (That is, FMA returns the fused multiply-add of x, y, and z.)
    **/
    @:native("FMA") static function FMA(x: Float, y: Float, z: Float): (Float);
    /**
        Float32bits returns the IEEE 754 binary representation of f,
        with the sign bit of f and the result in the same bit position.
        Float32bits(Float32frombits(x)) == x.
    **/
    @:native("Float32bits") static function float32bits(f: go.Float32): (go.UInt32);
    /**
        Float32frombits returns the floating-point number corresponding
        to the IEEE 754 binary representation b, with the sign bit of b
        and the result in the same bit position.
        Float32frombits(Float32bits(x)) == x.
    **/
    @:native("Float32frombits") static function float32frombits(b: go.UInt32): (go.Float32);
    /**
        Float64bits returns the IEEE 754 binary representation of f,
        with the sign bit of f and the result in the same bit position,
        and Float64bits(Float64frombits(x)) == x.
    **/
    @:native("Float64bits") static function float64bits(f: Float): (go.UInt64);
    /**
        Float64frombits returns the floating-point number corresponding
        to the IEEE 754 binary representation b, with the sign bit of b
        and the result in the same bit position.
        Float64frombits(Float64bits(x)) == x.
    **/
    @:native("Float64frombits") static function float64frombits(b: go.UInt64): (Float);
    /**
        Floor returns the greatest integer value less than or equal to x.
        
        Special cases are:
        
        	Floor(±0) = ±0
        	Floor(±Inf) = ±Inf
        	Floor(NaN) = NaN
    **/
    @:native("Floor") static function floor(x: Float): (Float);
    /**
        Frexp breaks f into a normalized fraction
        and an integral power of two.
        It returns frac and exp satisfying f == frac × 2**exp,
        with the absolute value of frac in the interval [½, 1).
        
        Special cases are:
        
        	Frexp(±0) = ±0, 0
        	Frexp(±Inf) = ±Inf, 0
        	Frexp(NaN) = NaN, 0
    **/
    @:go.Tuple("frac", "exp") @:native("Frexp") static function frexp(f: Float): (go.Tuple<{ frac: Float, exp: go.GoInt }>);
    /**
        Gamma returns the Gamma function of x.
        
        Special cases are:
        
        	Gamma(+Inf) = +Inf
        	Gamma(+0) = +Inf
        	Gamma(-0) = -Inf
        	Gamma(x) = NaN for integer x < 0
        	Gamma(-Inf) = NaN
        	Gamma(NaN) = NaN
    **/
    @:native("Gamma") static function gamma(x: Float): (Float);
    /**
        Hypot returns [Sqrt](p*p + q*q), taking care to avoid
        unnecessary overflow and underflow.
        
        Special cases are:
        
        	Hypot(±Inf, q) = +Inf
        	Hypot(p, ±Inf) = +Inf
        	Hypot(NaN, q) = NaN
        	Hypot(p, NaN) = NaN
    **/
    @:native("Hypot") static function hypot(p: Float, q: Float): (Float);
    /**
        Ilogb returns the binary exponent of x as an integer.
        
        Special cases are:
        
        	Ilogb(±Inf) = MaxInt32
        	Ilogb(0) = MinInt32
        	Ilogb(NaN) = MaxInt32
    **/
    @:native("Ilogb") static function ilogb(x: Float): (go.GoInt);
    /**
        Inf returns positive infinity if sign >= 0, negative infinity if sign < 0.
    **/
    @:native("Inf") static function inf(sign: go.GoInt): (Float);
    /**
        IsInf reports whether f is an infinity, according to sign.
        If sign > 0, IsInf reports whether f is positive infinity.
        If sign < 0, IsInf reports whether f is negative infinity.
        If sign == 0, IsInf reports whether f is either infinity.
    **/
    @:native("IsInf") static function isInf(f: Float, sign: go.GoInt): (Bool);
    /**
        IsNaN reports whether f is an IEEE 754 “not-a-number” value.
    **/
    @:native("IsNaN") static function isNaN(f: Float): (Bool);
    /**
        J0 returns the order-zero Bessel function of the first kind.
        
        Special cases are:
        
        	J0(±Inf) = 0
        	J0(0) = 1
        	J0(NaN) = NaN
    **/
    @:native("J0") static function J0(x: Float): (Float);
    /**
        J1 returns the order-one Bessel function of the first kind.
        
        Special cases are:
        
        	J1(±Inf) = 0
        	J1(NaN) = NaN
    **/
    @:native("J1") static function J1(x: Float): (Float);
    /**
        Jn returns the order-n Bessel function of the first kind.
        
        Special cases are:
        
        	Jn(n, ±Inf) = 0
        	Jn(n, NaN) = NaN
    **/
    @:native("Jn") static function jn(n: go.GoInt, x: Float): (Float);
    /**
        Ldexp is the inverse of [Frexp].
        It returns frac × 2**exp.
        
        Special cases are:
        
        	Ldexp(±0, exp) = ±0
        	Ldexp(±Inf, exp) = ±Inf
        	Ldexp(NaN, exp) = NaN
    **/
    @:native("Ldexp") static function ldexp(frac: Float, exp: go.GoInt): (Float);
    /**
        Lgamma returns the natural logarithm and sign (-1 or +1) of [Gamma](x).
        
        Special cases are:
        
        	Lgamma(+Inf) = +Inf
        	Lgamma(0) = +Inf
        	Lgamma(-integer) = +Inf
        	Lgamma(-Inf) = -Inf
        	Lgamma(NaN) = NaN
    **/
    @:go.Tuple("lgamma", "sign") @:native("Lgamma") static function lgamma(x: Float): (go.Tuple<{ lgamma: Float, sign: go.GoInt }>);
    /**
        Log returns the natural logarithm of x.
        
        Special cases are:
        
        	Log(+Inf) = +Inf
        	Log(0) = -Inf
        	Log(x < 0) = NaN
        	Log(NaN) = NaN
    **/
    @:native("Log") static function log(x: Float): (Float);
    /**
        Log10 returns the decimal logarithm of x.
        The special cases are the same as for [Log].
    **/
    @:native("Log10") static function log10(x: Float): (Float);
    /**
        Log1p returns the natural logarithm of 1 plus its argument x.
        It is more accurate than [Log](1 + x) when x is near zero.
        
        Special cases are:
        
        	Log1p(+Inf) = +Inf
        	Log1p(±0) = ±0
        	Log1p(-1) = -Inf
        	Log1p(x < -1) = NaN
        	Log1p(NaN) = NaN
    **/
    @:native("Log1p") static function log1p(x: Float): (Float);
    /**
        Log2 returns the binary logarithm of x.
        The special cases are the same as for [Log].
    **/
    @:native("Log2") static function log2(x: Float): (Float);
    /**
        Logb returns the binary exponent of x.
        
        Special cases are:
        
        	Logb(±Inf) = +Inf
        	Logb(0) = -Inf
        	Logb(NaN) = NaN
    **/
    @:native("Logb") static function logb(x: Float): (Float);
    /**
        Max returns the larger of x or y.
        
        Special cases are:
        
        	Max(x, +Inf) = Max(+Inf, x) = +Inf
        	Max(x, NaN) = Max(NaN, x) = NaN
        	Max(+0, ±0) = Max(±0, +0) = +0
        	Max(-0, -0) = -0
        
        Note that this differs from the built-in function max when called
        with NaN and +Inf.
    **/
    @:native("Max") static function max(x: Float, y: Float): (Float);
    /**
        Min returns the smaller of x or y.
        
        Special cases are:
        
        	Min(x, -Inf) = Min(-Inf, x) = -Inf
        	Min(x, NaN) = Min(NaN, x) = NaN
        	Min(-0, ±0) = Min(±0, -0) = -0
        
        Note that this differs from the built-in function min when called
        with NaN and -Inf.
    **/
    @:native("Min") static function min(x: Float, y: Float): (Float);
    /**
        Mod returns the floating-point remainder of x/y.
        The magnitude of the result is less than y and its
        sign agrees with that of x.
        
        Special cases are:
        
        	Mod(±Inf, y) = NaN
        	Mod(NaN, y) = NaN
        	Mod(x, 0) = NaN
        	Mod(x, ±Inf) = x
        	Mod(x, NaN) = NaN
    **/
    @:native("Mod") static function mod(x: Float, y: Float): (Float);
    /**
        Modf returns integer and fractional floating-point numbers
        that sum to f. Both values have the same sign as f.
        
        Special cases are:
        
        	Modf(±Inf) = ±Inf, NaN
        	Modf(NaN) = NaN, NaN
    **/
    @:go.Tuple("integer", "fractional") @:native("Modf") static function modf(f: Float): (go.Tuple<{ integer: Float, fractional: Float }>);
    /**
        NaN returns an IEEE 754 “not-a-number” value.
    **/
    @:native("NaN") static function naN(): (Float);
    /**
        Nextafter returns the next representable float64 value after x towards y.
        
        Special cases are:
        
        	Nextafter(x, x)   = x
        	Nextafter(NaN, y) = NaN
        	Nextafter(x, NaN) = NaN
    **/
    @:native("Nextafter") static function nextafter(x: Float, y: Float): (Float);
    /**
        Nextafter32 returns the next representable float32 value after x towards y.
        
        Special cases are:
        
        	Nextafter32(x, x)   = x
        	Nextafter32(NaN, y) = NaN
        	Nextafter32(x, NaN) = NaN
    **/
    @:native("Nextafter32") static function nextafter32(x: go.Float32, y: go.Float32): (go.Float32);
    /**
        Pow returns x**y, the base-x exponential of y.
        
        Special cases are (in order):
        
        	Pow(x, ±0) = 1 for any x
        	Pow(1, y) = 1 for any y
        	Pow(x, 1) = x for any x
        	Pow(NaN, y) = NaN
        	Pow(x, NaN) = NaN
        	Pow(±0, y) = ±Inf for y an odd integer < 0
        	Pow(±0, -Inf) = +Inf
        	Pow(±0, +Inf) = +0
        	Pow(±0, y) = +Inf for finite y < 0 and not an odd integer
        	Pow(±0, y) = ±0 for y an odd integer > 0
        	Pow(±0, y) = +0 for finite y > 0 and not an odd integer
        	Pow(-1, ±Inf) = 1
        	Pow(x, +Inf) = +Inf for |x| > 1
        	Pow(x, -Inf) = +0 for |x| > 1
        	Pow(x, +Inf) = +0 for |x| < 1
        	Pow(x, -Inf) = +Inf for |x| < 1
        	Pow(+Inf, y) = +Inf for y > 0
        	Pow(+Inf, y) = +0 for y < 0
        	Pow(-Inf, y) = Pow(-0, -y)
        	Pow(x, y) = NaN for finite x < 0 and finite non-integer y
    **/
    @:native("Pow") static function pow(x: Float, y: Float): (Float);
    /**
        Pow10 returns 10**n, the base-10 exponential of n.
        
        Special cases are:
        
        	Pow10(n) =    0 for n < -323
        	Pow10(n) = +Inf for n > 308
    **/
    @:native("Pow10") static function pow10(n: go.GoInt): (Float);
    /**
        Remainder returns the IEEE 754 floating-point remainder of x/y.
        
        Special cases are:
        
        	Remainder(±Inf, y) = NaN
        	Remainder(NaN, y) = NaN
        	Remainder(x, 0) = NaN
        	Remainder(x, ±Inf) = x
        	Remainder(x, NaN) = NaN
    **/
    @:native("Remainder") static function remainder(x: Float, y: Float): (Float);
    /**
        Round returns the nearest integer, rounding half away from zero.
        
        Special cases are:
        
        	Round(±0) = ±0
        	Round(±Inf) = ±Inf
        	Round(NaN) = NaN
    **/
    @:native("Round") static function round(x: Float): (Float);
    /**
        RoundToEven returns the nearest integer, rounding ties to even.
        
        Special cases are:
        
        	RoundToEven(±0) = ±0
        	RoundToEven(±Inf) = ±Inf
        	RoundToEven(NaN) = NaN
    **/
    @:native("RoundToEven") static function roundToEven(x: Float): (Float);
    /**
        Signbit reports whether x is negative or negative zero.
    **/
    @:native("Signbit") static function signbit(x: Float): (Bool);
    /**
        Sin returns the sine of the radian argument x.
        
        Special cases are:
        
        	Sin(±0) = ±0
        	Sin(±Inf) = NaN
        	Sin(NaN) = NaN
    **/
    @:native("Sin") static function sin(x: Float): (Float);
    /**
        Sincos returns Sin(x), Cos(x).
        
        Special cases are:
        
        	Sincos(±0) = ±0, 1
        	Sincos(±Inf) = NaN, NaN
        	Sincos(NaN) = NaN, NaN
    **/
    @:go.Tuple("sin", "cos") @:native("Sincos") static function sincos(x: Float): (go.Tuple<{ sin: Float, cos: Float }>);
    /**
        Sinh returns the hyperbolic sine of x.
        
        Special cases are:
        
        	Sinh(±0) = ±0
        	Sinh(±Inf) = ±Inf
        	Sinh(NaN) = NaN
    **/
    @:native("Sinh") static function sinh(x: Float): (Float);
    /**
        Sqrt returns the square root of x.
        
        Special cases are:
        
        	Sqrt(+Inf) = +Inf
        	Sqrt(±0) = ±0
        	Sqrt(x < 0) = NaN
        	Sqrt(NaN) = NaN
    **/
    @:native("Sqrt") static function sqrt(x: Float): (Float);
    /**
        Tan returns the tangent of the radian argument x.
        
        Special cases are:
        
        	Tan(±0) = ±0
        	Tan(±Inf) = NaN
        	Tan(NaN) = NaN
    **/
    @:native("Tan") static function tan(x: Float): (Float);
    /**
        Tanh returns the hyperbolic tangent of x.
        
        Special cases are:
        
        	Tanh(±0) = ±0
        	Tanh(±Inf) = ±1
        	Tanh(NaN) = NaN
    **/
    @:native("Tanh") static function tanh(x: Float): (Float);
    /**
        Trunc returns the integer value of x.
        
        Special cases are:
        
        	Trunc(±0) = ±0
        	Trunc(±Inf) = ±Inf
        	Trunc(NaN) = NaN
    **/
    @:native("Trunc") static function trunc(x: Float): (Float);
    /**
        Y0 returns the order-zero Bessel function of the second kind.
        
        Special cases are:
        
        	Y0(+Inf) = 0
        	Y0(0) = -Inf
        	Y0(x < 0) = NaN
        	Y0(NaN) = NaN
    **/
    @:native("Y0") static function Y0(x: Float): (Float);
    /**
        Y1 returns the order-one Bessel function of the second kind.
        
        Special cases are:
        
        	Y1(+Inf) = 0
        	Y1(0) = -Inf
        	Y1(x < 0) = NaN
        	Y1(NaN) = NaN
    **/
    @:native("Y1") static function Y1(x: Float): (Float);
    /**
        Yn returns the order-n Bessel function of the second kind.
        
        Special cases are:
        
        	Yn(n, +Inf) = 0
        	Yn(n ≥ 0, 0) = -Inf
        	Yn(n < 0, 0) = +Inf if n is odd, -Inf if n is even
        	Yn(n, x < 0) = NaN
        	Yn(n, NaN) = NaN
    **/
    @:native("Yn") static function yn(n: go.GoInt, x: Float): (Float);

}