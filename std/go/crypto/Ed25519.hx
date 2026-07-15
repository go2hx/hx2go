package go.crypto;

@:go.Type({ name: "ed25519", instanceName: "ed25519.ed25519", imports: ["crypto/ed25519"] })
extern class Ed25519 {

    @:native("PrivateKeySize") static var PrivateKeySize: go.GoInt;
    @:native("PublicKeySize") static var PublicKeySize: go.GoInt;
    @:native("SeedSize") static var SeedSize: go.GoInt;
    @:native("SignatureSize") static var SignatureSize: go.GoInt;

    @:go.Tuple("p0", "p1", "p2") @:native("GenerateKey") static function generateKey(random: go.io.Reader): go.Tuple<{ p0: go.crypto.ed25519.PublicKey, p1: go.crypto.ed25519.PrivateKey, p2: go.Error }>;
    @:native("NewKeyFromSeed") static function newKeyFromSeed(seed: go.Slice<go.Byte>): go.crypto.ed25519.PrivateKey;
    @:native("Sign") static function sign(privateKey: go.crypto.ed25519.PrivateKey, message: go.Slice<go.Byte>): go.Slice<go.Byte>;
    @:native("Verify") static function verify(publicKey: go.crypto.ed25519.PublicKey, message: go.Slice<go.Byte>, sig: go.Slice<go.Byte>): Bool;
    @:native("VerifyWithOptions") static function verifyWithOptions(publicKey: go.crypto.ed25519.PublicKey, message: go.Slice<go.Byte>, sig: go.Slice<go.Byte>, opts: go.Pointer<go.crypto.ed25519.Options>): go.Error;

}