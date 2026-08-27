package go.crypto.elliptic;

@:structInit
@:go.Type({ name: "CurveParams", instanceName: "elliptic.CurveParams", imports: ["crypto/elliptic"] })
extern class CurveParams {

    @:native("P") var P: go.Pointer<go.math.big.Int>;
    @:native("N") var N: go.Pointer<go.math.big.Int>;
    @:native("B") var B: go.Pointer<go.math.big.Int>;
    @:native("Gx") var gx: go.Pointer<go.math.big.Int>;
    @:native("Gy") var gy: go.Pointer<go.math.big.Int>;
    @:native("BitSize") var bitSize: go.GoInt;
    @:native("Name") var name: String;

    function new(P: go.Pointer<go.math.big.Int>=null, N: go.Pointer<go.math.big.Int>=null, B: go.Pointer<go.math.big.Int>=null, gx: go.Pointer<go.math.big.Int>=null, gy: go.Pointer<go.math.big.Int>=null, bitSize: go.GoInt=0, name: String="");

    @:go.Tuple("p0", "p1") @:native("Add") function add(x1: go.Pointer<go.math.big.Int>, y1: go.Pointer<go.math.big.Int>, x2: go.Pointer<go.math.big.Int>, y2: go.Pointer<go.math.big.Int>): (go.Tuple<{ p0: go.Pointer<go.math.big.Int>, p1: go.Pointer<go.math.big.Int> }>);
    @:go.Tuple("p0", "p1") @:native("Double") function double(x1: go.Pointer<go.math.big.Int>, y1: go.Pointer<go.math.big.Int>): (go.Tuple<{ p0: go.Pointer<go.math.big.Int>, p1: go.Pointer<go.math.big.Int> }>);
    @:native("IsOnCurve") function isOnCurve(x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>): (Bool);
    @:native("Params") function params(): (go.Pointer<go.crypto.elliptic.CurveParams>);
    @:go.Tuple("p0", "p1") @:native("ScalarBaseMult") function scalarBaseMult(k: go.Slice<go.Byte>): (go.Tuple<{ p0: go.Pointer<go.math.big.Int>, p1: go.Pointer<go.math.big.Int> }>);
    @:go.Tuple("p0", "p1") @:native("ScalarMult") function scalarMult(Bx: go.Pointer<go.math.big.Int>, By: go.Pointer<go.math.big.Int>, k: go.Slice<go.Byte>): (go.Tuple<{ p0: go.Pointer<go.math.big.Int>, p1: go.Pointer<go.math.big.Int> }>);

}