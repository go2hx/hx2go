package go.crypto.rsa;

@:structInit
@:go.Type({ name: "PrivateKey", instanceName: "rsa.PrivateKey", imports: ["crypto/rsa"] })
extern class PrivateKey {

    @:native("PublicKey") var publicKey: go.crypto.rsa.PublicKey;
    @:native("D") var D: go.Pointer<go.math.big.Int>;
    @:native("Primes") var primes: go.Slice<go.Pointer<go.math.big.Int>>;
    @:native("Precomputed") var precomputed: go.crypto.rsa.PrecomputedValues;

function new(publicKey: go.crypto.rsa.PublicKey, D: go.Pointer<go.math.big.Int>, primes: go.Slice<go.Pointer<go.math.big.Int>>, precomputed: go.crypto.rsa.PrecomputedValues);

    @:native("Decrypt") function decrypt(rand: go.io.Reader, ciphertext: go.Slice<go.Byte>, opts: go.crypto.DecrypterOpts): go.Result<go.Slice<go.Byte>>;
    @:native("Equal") function equal(x: go.crypto.PrivateKey): Bool;
    @:native("Precompute") function precompute(): Void;
    @:native("Public") function _public(): go.crypto.PublicKey;
    @:native("Sign") function sign(rand: go.io.Reader, digest: go.Slice<go.Byte>, opts: go.crypto.SignerOpts): go.Result<go.Slice<go.Byte>>;
    @:native("Size") function size(): go.GoInt;
    @:native("Validate") function validate(): go.Error;

}