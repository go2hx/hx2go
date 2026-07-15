package go.crypto.ecdsa;

@:structInit
@:go.Type({ name: "PrivateKey", instanceName: "ecdsa.PrivateKey", imports: ["crypto/ecdsa"] })
extern class PrivateKey {

    @:native("PublicKey") var publicKey: go.crypto.ecdsa.PublicKey;
    @:native("D") var D: go.Pointer<go.math.big.Int>;

function new(publicKey: go.crypto.ecdsa.PublicKey, D: go.Pointer<go.math.big.Int>);

    @:go.Tuple("x", "y") @:native("Add") function add(x1: go.Pointer<go.math.big.Int>, y1: go.Pointer<go.math.big.Int>, x2: go.Pointer<go.math.big.Int>, y2: go.Pointer<go.math.big.Int>): go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>;
    @:native("Bytes") function bytes(): go.Result<go.Slice<go.Byte>>;
    @:go.Tuple("x", "y") @:native("Double") function double(x1: go.Pointer<go.math.big.Int>, y1: go.Pointer<go.math.big.Int>): go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>;
    @:native("ECDH") function ECDH(): go.Result<go.Pointer<go.crypto.ecdh.PrivateKey>>;
    @:native("Equal") function equal(x: go.crypto.PrivateKey): Bool;
    @:native("IsOnCurve") function isOnCurve(x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int>): Bool;
    @:native("Params") function params(): go.Pointer<go.crypto.elliptic.CurveParams>;
    @:native("Public") function _public(): go.crypto.PublicKey;
    @:go.Tuple("x", "y") @:native("ScalarBaseMult") function scalarBaseMult(k: go.Slice<go.Byte>): go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>;
    @:go.Tuple("x", "y") @:native("ScalarMult") function scalarMult(x1: go.Pointer<go.math.big.Int>, y1: go.Pointer<go.math.big.Int>, k: go.Slice<go.Byte>): go.Tuple<{ x: go.Pointer<go.math.big.Int>, y: go.Pointer<go.math.big.Int> }>;
    @:native("Sign") function sign(random: go.io.Reader, digest: go.Slice<go.Byte>, opts: go.crypto.SignerOpts): go.Result<go.Slice<go.Byte>>;

}