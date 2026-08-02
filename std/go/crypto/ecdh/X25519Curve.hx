package go.crypto.ecdh;

@:structInit
@:go.Type({ name: "x25519Curve", instanceName: "ecdh.x25519Curve", imports: ["crypto/ecdh"] })
extern class X25519Curve {

    @:native("GenerateKey") function generateKey(r: go.io.Reader): (go.Result<go.Pointer<go.crypto.ecdh.PrivateKey>>);
    @:native("NewPrivateKey") function newPrivateKey(key: go.Slice<go.Byte>): (go.Result<go.Pointer<go.crypto.ecdh.PrivateKey>>);
    @:native("NewPublicKey") function newPublicKey(key: go.Slice<go.Byte>): (go.Result<go.Pointer<go.crypto.ecdh.PublicKey>>);
    @:native("String") function string(): (String);

}