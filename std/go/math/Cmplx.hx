package go.math;

/**
    Package cmplx provides basic constants and mathematical functions for
    complex numbers. Special case handling conforms to the C99 standard
    Annex G IEC 60559-compatible complex arithmetic.
**/
@:go.Type({ name: "cmplx", instanceName: "cmplx.cmplx", imports: ["math/cmplx"] })
extern class Cmplx {

    /**
        Abs returns the absolute value (also called the modulus) of x.
    **/
    @:native("Abs") static function abs(x: go.Complex128): (Float);
    /**
        Acos returns the inverse cosine of x.
    **/
    @:native("Acos") static function acos(x: go.Complex128): (go.Complex128);
    /**
        Acosh returns the inverse hyperbolic cosine of x.
    **/
    @:native("Acosh") static function acosh(x: go.Complex128): (go.Complex128);
    /**
        Asin returns the inverse sine of x.
    **/
    @:native("Asin") static function asin(x: go.Complex128): (go.Complex128);
    /**
        Asinh returns the inverse hyperbolic sine of x.
    **/
    @:native("Asinh") static function asinh(x: go.Complex128): (go.Complex128);
    /**
        Atan returns the inverse tangent of x.
    **/
    @:native("Atan") static function atan(x: go.Complex128): (go.Complex128);
    /**
        Atanh returns the inverse hyperbolic tangent of x.
    **/
    @:native("Atanh") static function atanh(x: go.Complex128): (go.Complex128);
    /**
        Conj returns the complex conjugate of x.
    **/
    @:native("Conj") static function conj(x: go.Complex128): (go.Complex128);
    /**
        Cos returns the cosine of x.
    **/
    @:native("Cos") static function cos(x: go.Complex128): (go.Complex128);
    /**
        Cosh returns the hyperbolic cosine of x.
    **/
    @:native("Cosh") static function cosh(x: go.Complex128): (go.Complex128);
    /**
        Cot returns the cotangent of x.
    **/
    @:native("Cot") static function cot(x: go.Complex128): (go.Complex128);
    /**
        Exp returns e**x, the base-e exponential of x.
    **/
    @:native("Exp") static function exp(x: go.Complex128): (go.Complex128);
    /**
        Inf returns a complex infinity, complex(+Inf, +Inf).
    **/
    @:native("Inf") static function inf(): (go.Complex128);
    /**
        IsInf reports whether either real(x) or imag(x) is an infinity.
    **/
    @:native("IsInf") static function isInf(x: go.Complex128): (Bool);
    /**
        IsNaN reports whether either real(x) or imag(x) is NaN
        and neither is an infinity.
    **/
    @:native("IsNaN") static function isNaN(x: go.Complex128): (Bool);
    /**
        Log returns the natural logarithm of x.
    **/
    @:native("Log") static function log(x: go.Complex128): (go.Complex128);
    /**
        Log10 returns the decimal logarithm of x.
    **/
    @:native("Log10") static function log10(x: go.Complex128): (go.Complex128);
    /**
        NaN returns a complex “not-a-number” value.
    **/
    @:native("NaN") static function naN(): (go.Complex128);
    /**
        Phase returns the phase (also called the argument) of x.
        The returned value is in the range [-Pi, Pi].
    **/
    @:native("Phase") static function phase(x: go.Complex128): (Float);
    /**
        Polar returns the absolute value r and phase θ of x,
        such that x = r * e**θi.
        The phase is in the range [-Pi, Pi].
    **/
    @:go.Tuple("r", "_u3B8") @:native("Polar") static function polar(x: go.Complex128): (go.Tuple<{ r: Float, _u3B8: Float }>);
    /**
        Pow returns x**y, the base-x exponential of y.
        For generalized compatibility with [math.Pow]:
        
        	Pow(0, ±0) returns 1+0i
        	Pow(0, c) for real(c)<0 returns Inf+0i if imag(c) is zero, otherwise Inf+Inf i.
    **/
    @:native("Pow") static function pow(x: go.Complex128, y: go.Complex128): (go.Complex128);
    /**
        Rect returns the complex number x with polar coordinates r, θ.
    **/
    @:native("Rect") static function rect(r: Float, _u3B8: Float): (go.Complex128);
    /**
        Sin returns the sine of x.
    **/
    @:native("Sin") static function sin(x: go.Complex128): (go.Complex128);
    /**
        Sinh returns the hyperbolic sine of x.
    **/
    @:native("Sinh") static function sinh(x: go.Complex128): (go.Complex128);
    /**
        Sqrt returns the square root of x.
        The result r is chosen so that real(r) ≥ 0 and imag(r) has the same sign as imag(x).
    **/
    @:native("Sqrt") static function sqrt(x: go.Complex128): (go.Complex128);
    /**
        Tan returns the tangent of x.
    **/
    @:native("Tan") static function tan(x: go.Complex128): (go.Complex128);
    /**
        Tanh returns the hyperbolic tangent of x.
    **/
    @:native("Tanh") static function tanh(x: go.Complex128): (go.Complex128);

}