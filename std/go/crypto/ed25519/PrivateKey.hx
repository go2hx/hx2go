package go.crypto.ed25519;

@:go.Type({ name: "PrivateKey", instanceName: "ed25519.PrivateKey", imports: ["crypto/ed25519"] })
extern class PrivateKey {

    @:native("Equal") function equal(x: go.crypto.PrivateKey): Bool;
    @:native("Public") function _public(): go.crypto.PublicKey;
    @:native("Seed") function seed(): go.Slice<go.Byte>;
    @:native("Sign") function sign(rand: go.io.Reader, message: go.Slice<go.Byte>, opts: go.crypto.SignerOpts): go.Result<go.Slice<go.Byte>>;

}