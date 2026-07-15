package go.crypto.internal.fips140;

@:go.Type({ name: "mldsa", instanceName: "mldsa.mldsa", imports: ["crypto/internal/fips140/mldsa"] })
extern class Mldsa {

    @:native("PrivateKeySize") static var PrivateKeySize: go.GoInt;
    @:native("PublicKeySize44") static var PublicKeySize44: go.GoInt;
    @:native("PublicKeySize65") static var PublicKeySize65: go.GoInt;
    @:native("PublicKeySize87") static var PublicKeySize87: go.GoInt;
    @:native("R") static var R: go.GoInt;
    @:native("RR") static var RR: go.GoInt;
    @:native("SignatureSize44") static var SignatureSize44: go.GoInt;
    @:native("SignatureSize65") static var SignatureSize65: go.GoInt;
    @:native("SignatureSize87") static var SignatureSize87: go.GoInt;

    @:native("GenerateKey44") static function generateKey44(): go.Pointer<go.crypto.internal.fips140.mldsa.PrivateKey>;
    @:native("GenerateKey65") static function generateKey65(): go.Pointer<go.crypto.internal.fips140.mldsa.PrivateKey>;
    @:native("GenerateKey87") static function generateKey87(): go.Pointer<go.crypto.internal.fips140.mldsa.PrivateKey>;
    @:native("NewPrivateKey44") static function newPrivateKey44(seed: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.mldsa.PrivateKey>>;
    @:native("NewPrivateKey65") static function newPrivateKey65(seed: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.mldsa.PrivateKey>>;
    @:native("NewPrivateKey87") static function newPrivateKey87(seed: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.mldsa.PrivateKey>>;
    @:native("NewPublicKey44") static function newPublicKey44(pk: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.mldsa.PublicKey>>;
    @:native("NewPublicKey65") static function newPublicKey65(pk: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.mldsa.PublicKey>>;
    @:native("NewPublicKey87") static function newPublicKey87(pk: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.mldsa.PublicKey>>;
    @:native("Sign") static function sign(priv: go.Pointer<go.crypto.internal.fips140.mldsa.PrivateKey>, msg: go.Slice<go.Byte>, context: String): go.Result<go.Slice<go.Byte>>;
    @:native("SignDeterministic") static function signDeterministic(priv: go.Pointer<go.crypto.internal.fips140.mldsa.PrivateKey>, msg: go.Slice<go.Byte>, context: String): go.Result<go.Slice<go.Byte>>;
    @:native("SignExternalMu") static function signExternalMu(priv: go.Pointer<go.crypto.internal.fips140.mldsa.PrivateKey>, μ: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("SignExternalMuDeterministic") static function signExternalMuDeterministic(priv: go.Pointer<go.crypto.internal.fips140.mldsa.PrivateKey>, μ: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("TestingOnlyNewPrivateKeyFromSemiExpanded") static function testingOnlyNewPrivateKeyFromSemiExpanded(sk: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.mldsa.PrivateKey>>;
    @:native("TestingOnlyPrivateKeySemiExpandedBytes") static function testingOnlyPrivateKeySemiExpandedBytes(priv: go.Pointer<go.crypto.internal.fips140.mldsa.PrivateKey>): go.Slice<go.Byte>;
    @:native("TestingOnlySignExternalMuWithRandom") static function testingOnlySignExternalMuWithRandom(priv: go.Pointer<go.crypto.internal.fips140.mldsa.PrivateKey>, μ: go.Slice<go.Byte>, random: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("TestingOnlySignWithRandom") static function testingOnlySignWithRandom(priv: go.Pointer<go.crypto.internal.fips140.mldsa.PrivateKey>, msg: go.Slice<go.Byte>, context: String, random: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("Verify") static function verify(pub: go.Pointer<go.crypto.internal.fips140.mldsa.PublicKey>, msg: go.Slice<go.Byte>, sig: go.Slice<go.Byte>, context: String): go.Error;
    @:native("VerifyExternalMu") static function verifyExternalMu(pub: go.Pointer<go.crypto.internal.fips140.mldsa.PublicKey>, μ: go.Slice<go.Byte>, sig: go.Slice<go.Byte>): go.Error;

}