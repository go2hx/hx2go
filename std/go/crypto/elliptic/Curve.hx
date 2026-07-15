package go.crypto.elliptic;

@:go.Type({ name: "Curve", instanceName: "elliptic.Curve", imports: ["crypto/elliptic"] })
extern typedef Curve = {

    @:go.Tuple("x", "y") @:native("Add") function add(x1: go.Pointer<go.math.big.Int>, y1: go.Pointer<go.math.big.Int>, x2: go.Pointer<go.math.big.Int>, y2: go.Pointer<go.math.big.Int>): go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>;
    @:go.Tuple("x", "y") @:native("Double") function double(x1: go.Pointer<go.math.big.Int>, y1: go.Pointer<go.math.big.Int>): go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>;
    @:native("IsOnCurve") function isOnCurve(x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>): Bool;
    @:native("Params") function params(): go.Pointer<go.crypto.elliptic.CurveParams>;
    @:go.Tuple("x", "y") @:native("ScalarBaseMult") function scalarBaseMult(k: go.Slice<go.Byte>): go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>;
    @:go.Tuple("x", "y") @:native("ScalarMult") function scalarMult(x1: go.Pointer<go.math.big.Int>, y1: go.Pointer<go.math.big.Int>, k: go.Slice<go.Byte>): go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>;

}