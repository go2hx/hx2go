package go.crypto.internal.fips140;

@:go.Type({ name: "ed25519", instanceName: "ed25519.ed25519", imports: ["crypto/internal/fips140/ed25519"] })
extern class Ed25519 {

    @:native("GenerateKey") static function generateKey(): go.Result<go.Pointer<go.crypto.internal.fips140.ed25519.PrivateKey>>;
    @:native("NewPrivateKey") static function newPrivateKey(priv: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.ed25519.PrivateKey>>;
    @:native("NewPrivateKeyFromSeed") static function newPrivateKeyFromSeed(seed: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.ed25519.PrivateKey>>;
    @:native("NewPublicKey") static function newPublicKey(pub: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.ed25519.PublicKey>>;
    @:native("Sign") static function sign(priv: go.Pointer<go.crypto.internal.fips140.ed25519.PrivateKey>, message: go.Slice<go.Byte>): go.Slice<go.Byte>;
    @:native("SignCtx") static function signCtx(priv: go.Pointer<go.crypto.internal.fips140.ed25519.PrivateKey>, message: go.Slice<go.Byte>, context: String): go.Result<go.Slice<go.Byte>>;
    @:native("SignPH") static function signPH(priv: go.Pointer<go.crypto.internal.fips140.ed25519.PrivateKey>, message: go.Slice<go.Byte>, context: String): go.Result<go.Slice<go.Byte>>;
    @:native("Verify") static function verify(pub: go.Pointer<go.crypto.internal.fips140.ed25519.PublicKey>, message: go.Slice<go.Byte>, sig: go.Slice<go.Byte>): go.Error;
    @:native("VerifyCtx") static function verifyCtx(pub: go.Pointer<go.crypto.internal.fips140.ed25519.PublicKey>, message: go.Slice<go.Byte>, sig: go.Slice<go.Byte>, context: String): go.Error;
    @:native("VerifyPH") static function verifyPH(pub: go.Pointer<go.crypto.internal.fips140.ed25519.PublicKey>, message: go.Slice<go.Byte>, sig: go.Slice<go.Byte>, context: String): go.Error;

}