package go.crypto;

@:go.Type({ name: "ecdsa", instanceName: "ecdsa.ecdsa", imports: ["crypto/ecdsa"] })
extern class Ecdsa {

    @:native("GenerateKey") static function generateKey(c: go.crypto.elliptic.Curve, r: go.io.Reader): go.Result<go.Pointer<go.crypto.ecdsa.PrivateKey>>;
    @:native("ParseRawPrivateKey") static function parseRawPrivateKey(curve: go.crypto.elliptic.Curve, data: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.ecdsa.PrivateKey>>;
    @:native("ParseUncompressedPublicKey") static function parseUncompressedPublicKey(curve: go.crypto.elliptic.Curve, data: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.ecdsa.PublicKey>>;
    @:go.Tuple("r", "s", "err") @:native("Sign") static function sign(rand: go.io.Reader, priv: go.Pointer<go.crypto.ecdsa.PrivateKey>, hash: go.Slice<go.Byte>): go.Tuple<{ r: go.Pointer<go.math.big.Int>, s: go.Pointer<go.math.big.Int>, err: go.Error }>;
    @:native("SignASN1") static function signASN1(r: go.io.Reader, priv: go.Pointer<go.crypto.ecdsa.PrivateKey>, hash: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("Verify") static function verify(pub: go.Pointer<go.crypto.ecdsa.PublicKey>, hash: go.Slice<go.Byte>, r: go.Pointer<go.math.big.Int>, s: go.Pointer<go.math.big.Int>): Bool;
    @:native("VerifyASN1") static function verifyASN1(pub: go.Pointer<go.crypto.ecdsa.PublicKey>, hash: go.Slice<go.Byte>, sig: go.Slice<go.Byte>): Bool;

}