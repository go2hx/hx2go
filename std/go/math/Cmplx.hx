package go.math;

@:go.Type({ name: "cmplx", instanceName: "cmplx.cmplx", imports: ["math/cmplx"] })
extern class Cmplx {

    @:native("Abs") static function abs(x: go.Complex128): Float;
    @:native("Acos") static function acos(x: go.Complex128): go.Complex128;
    @:native("Acosh") static function acosh(x: go.Complex128): go.Complex128;
    @:native("Asin") static function asin(x: go.Complex128): go.Complex128;
    @:native("Asinh") static function asinh(x: go.Complex128): go.Complex128;
    @:native("Atan") static function atan(x: go.Complex128): go.Complex128;
    @:native("Atanh") static function atanh(x: go.Complex128): go.Complex128;
    @:native("Conj") static function conj(x: go.Complex128): go.Complex128;
    @:native("Cos") static function cos(x: go.Complex128): go.Complex128;
    @:native("Cosh") static function cosh(x: go.Complex128): go.Complex128;
    @:native("Cot") static function cot(x: go.Complex128): go.Complex128;
    @:native("Exp") static function exp(x: go.Complex128): go.Complex128;
    @:native("Inf") static function inf(): go.Complex128;
    @:native("IsInf") static function isInf(x: go.Complex128): Bool;
    @:native("IsNaN") static function isNaN(x: go.Complex128): Bool;
    @:native("Log") static function log(x: go.Complex128): go.Complex128;
    @:native("Log10") static function log10(x: go.Complex128): go.Complex128;
    @:native("NaN") static function naN(): go.Complex128;
    @:native("Phase") static function phase(x: go.Complex128): Float;
    @:go.Tuple("r", "θ") @:native("Polar") static function polar(x: go.Complex128): go.Tuple<{ r: Float, θ: Float }>;
    @:native("Pow") static function pow(x: go.Complex128, y: go.Complex128): go.Complex128;
    @:native("Rect") static function rect(r: Float, θ: Float): go.Complex128;
    @:native("Sin") static function sin(x: go.Complex128): go.Complex128;
    @:native("Sinh") static function sinh(x: go.Complex128): go.Complex128;
    @:native("Sqrt") static function sqrt(x: go.Complex128): go.Complex128;
    @:native("Tan") static function tan(x: go.Complex128): go.Complex128;
    @:native("Tanh") static function tanh(x: go.Complex128): go.Complex128;

}