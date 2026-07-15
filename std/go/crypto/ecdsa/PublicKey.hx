package go.crypto.ecdsa;

@:structInit
@:go.Type({ name: "PublicKey", instanceName: "ecdsa.PublicKey", imports: ["crypto/ecdsa"] })
extern class PublicKey {

    @:native("Curve") var curve: go.crypto.elliptic.Curve;
    @:native("X") var X: go.Pointer<go.math.big.Int>;
    @:native("Y") var Y: go.Pointer<go.math.big.Int>;

function new(curve: go.crypto.elliptic.Curve, X: go.Pointer<go.math.big.Int>, Y: go.Pointer<go.math.big.Int>);

    @:go.Tuple("x", "y") @:native("Add") function add(x1: go.Pointer<go.math.big.Int>, y1: go.Pointer<go.math.big.Int>, x2: go.Pointer<go.math.big.Int>, y2: go.Pointer<go.math.big.Int>): go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>;
    @:native("Bytes") function bytes(): go.Result<go.Slice<go.Byte>>;
    @:go.Tuple("x", "y") @:native("Double") function double(x1: go.Pointer<go.math.big.Int>, y1: go.Pointer<go.math.big.Int>): go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>;
    @:native("ECDH") function ECDH(): go.Result<go.Pointer<go.crypto.ecdh.PublicKey>>;
    @:native("Equal") function equal(x: go.crypto.PublicKey): Bool;
    @:native("IsOnCurve") function isOnCurve(x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>): Bool;
    @:native("Params") function params(): go.Pointer<go.crypto.elliptic.CurveParams>;
    @:go.Tuple("x", "y") @:native("ScalarBaseMult") function scalarBaseMult(k: go.Slice<go.Byte>): go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>;
    @:go.Tuple("x", "y") @:native("ScalarMult") function scalarMult(x1: go.Pointer<go.math.big.Int>, y1: go.Pointer<go.math.big.Int>, k: go.Slice<go.Byte>): go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>;

}