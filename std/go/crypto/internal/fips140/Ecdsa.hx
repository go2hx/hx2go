package go.crypto.internal.fips140;

@:go.Type({ name: "ecdsa", instanceName: "ecdsa.ecdsa", imports: ["crypto/internal/fips140/ecdsa"] })
extern class Ecdsa {

    @:native("GenerateKey") static function generateKey<P: go.crypto.internal.fips140.ecdsa.Point<P>>(c: go.Pointer<go.crypto.internal.fips140.ecdsa.Curve<P>>, rand: go.io.Reader): go.Result<go.Pointer<go.crypto.internal.fips140.ecdsa.PrivateKey>>;
    @:native("NewPrivateKey") static function newPrivateKey<P: go.crypto.internal.fips140.ecdsa.Point<P>>(c: go.Pointer<go.crypto.internal.fips140.ecdsa.Curve<P>>, D: go.Slice<go.Byte>, Q: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.ecdsa.PrivateKey>>;
    @:native("NewPublicKey") static function newPublicKey<P: go.crypto.internal.fips140.ecdsa.Point<P>>(c: go.Pointer<go.crypto.internal.fips140.ecdsa.Curve<P>>, Q: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.ecdsa.PublicKey>>;
    @:native("P224") static function P224(): go.Pointer<go.crypto.internal.fips140.ecdsa.Curve<go.Pointer<go.crypto.internal.fips140.nistec.P224Point>>>;
    @:native("P256") static function P256(): go.Pointer<go.crypto.internal.fips140.ecdsa.Curve<go.Pointer<go.crypto.internal.fips140.nistec.P256Point>>>;
    @:native("P384") static function P384(): go.Pointer<go.crypto.internal.fips140.ecdsa.Curve<go.Pointer<go.crypto.internal.fips140.nistec.P384Point>>>;
    @:native("P521") static function P521(): go.Pointer<go.crypto.internal.fips140.ecdsa.Curve<go.Pointer<go.crypto.internal.fips140.nistec.P521Point>>>;
    @:native("Sign") static function sign<P: go.crypto.internal.fips140.ecdsa.Point<P>, H: go.hash.Hash>(c: go.Pointer<go.crypto.internal.fips140.ecdsa.Curve<P>>, h: () -> H, priv: go.Pointer<go.crypto.internal.fips140.ecdsa.PrivateKey>, rand: go.io.Reader, hash: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.ecdsa.Signature>>;
    @:native("SignDeterministic") static function signDeterministic<P: go.crypto.internal.fips140.ecdsa.Point<P>, H: go.hash.Hash>(c: go.Pointer<go.crypto.internal.fips140.ecdsa.Curve<P>>, h: () -> H, priv: go.Pointer<go.crypto.internal.fips140.ecdsa.PrivateKey>, hash: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.ecdsa.Signature>>;
    @:native("TestingOnlyNewDRBG") static function testingOnlyNewDRBG<H: go.hash.Hash>(hash: () -> H, entropy: go.Slice<go.Byte>, nonce: go.Slice<go.Byte>, s: go.Slice<go.Byte>): go.Pointer<go.crypto.internal.fips140.ecdsa.hmacDRBG>;
    @:native("Verify") static function verify<P: go.crypto.internal.fips140.ecdsa.Point<P>>(c: go.Pointer<go.crypto.internal.fips140.ecdsa.Curve<P>>, pub: go.Pointer<go.crypto.internal.fips140.ecdsa.PublicKey>, hash: go.Slice<go.Byte>, sig: go.Pointer<go.crypto.internal.fips140.ecdsa.Signature>): go.Error;

}