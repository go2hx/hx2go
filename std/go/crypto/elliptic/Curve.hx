package go.crypto.elliptic;

/**
    A Curve represents a short-form Weierstrass curve with a=-3.
    
    The behavior of Add, Double, and ScalarMult when the input is not a point on
    the curve is undefined.
    
    Note that the conventional point at infinity (0, 0) is not considered on the
    curve, although it can be returned by Add, Double, ScalarMult, or
    ScalarBaseMult (but not the [Unmarshal] or [UnmarshalCompressed] functions).
    
    Using Curve implementations besides those returned by [P224], [P256], [P384],
    and [P521] is deprecated.
**/
@:go.Type({ name: "Curve", instanceName: "elliptic.Curve", imports: ["crypto/elliptic"] })
extern typedef Curve = {

    @:go.Tuple("x", "y") @:native("Add") function add(x1: go.Pointer<go.math.big.Int>, y1: go.Pointer<go.math.big.Int>, x2: go.Pointer<go.math.big.Int>, y2: go.Pointer<go.math.big.Int>): (go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>);
    @:go.Tuple("x", "y") @:native("Double") function double(x1: go.Pointer<go.math.big.Int>, y1: go.Pointer<go.math.big.Int>): (go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>);
    @:native("IsOnCurve") function isOnCurve(x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>): (Bool);
    @:native("Params") function params(): (go.Pointer<go.crypto.elliptic.CurveParams>);
    @:go.Tuple("x", "y") @:native("ScalarBaseMult") function scalarBaseMult(k: go.Slice<go.Byte>): (go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>);
    @:go.Tuple("x", "y") @:native("ScalarMult") function scalarMult(x1: go.Pointer<go.math.big.Int>, y1: go.Pointer<go.math.big.Int>, k: go.Slice<go.Byte>): (go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>);

}