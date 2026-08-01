package go.crypto.elliptic;

@:structInit
@:go.Type({ name: "nistCurve", instanceName: "elliptic.nistCurve", imports: ["crypto/elliptic"] })
extern class NistCurve<Point: go.crypto.elliptic.NistPoint<Point>> {

    @:go.Tuple("p0", "p1") @:native("Add") function add(x1: go.Pointer<go.math.big.Int>, y1: go.Pointer<go.math.big.Int>, x2: go.Pointer<go.math.big.Int>, y2: go.Pointer<go.math.big.Int>): (go.Tuple<{ p0: go.Pointer<go.math.big.Int>, p1: go.Pointer<go.math.big.Int> }>);
    @:go.Tuple("p0", "p1") @:native("Double") function double(x1: go.Pointer<go.math.big.Int>, y1: go.Pointer<go.math.big.Int>): (go.Tuple<{ p0: go.Pointer<go.math.big.Int>, p1: go.Pointer<go.math.big.Int> }>);
    @:native("IsOnCurve") function isOnCurve(x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>): (Bool);
    @:native("Params") function params(): (go.Pointer<go.crypto.elliptic.CurveParams>);
    @:go.Tuple("p0", "p1") @:native("ScalarBaseMult") function scalarBaseMult(scalar: go.Slice<go.Byte>): (go.Tuple<{ p0: go.Pointer<go.math.big.Int>, p1: go.Pointer<go.math.big.Int> }>);
    @:go.Tuple("p0", "p1") @:native("ScalarMult") function scalarMult(Bx: go.Pointer<go.math.big.Int>, By: go.Pointer<go.math.big.Int>, scalar: go.Slice<go.Byte>): (go.Tuple<{ p0: go.Pointer<go.math.big.Int>, p1: go.Pointer<go.math.big.Int> }>);
    @:go.Tuple("x", "y") @:native("Unmarshal") function unmarshal(data: go.Slice<go.Byte>): (go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>);
    @:go.Tuple("x", "y") @:native("UnmarshalCompressed") function unmarshalCompressed(data: go.Slice<go.Byte>): (go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>);

}