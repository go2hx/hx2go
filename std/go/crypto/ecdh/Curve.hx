package go.crypto.ecdh;

@:go.Type({ name: "Curve", instanceName: "ecdh.Curve", imports: ["crypto/ecdh"] })
extern typedef Curve = {

    @:native("GenerateKey") function generateKey(rand: go.io.Reader): go.Result<go.Pointer<go.crypto.ecdh.PrivateKey>>;
    @:native("NewPrivateKey") function newPrivateKey(key: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.ecdh.PrivateKey>>;
    @:native("NewPublicKey") function newPublicKey(key: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.ecdh.PublicKey>>;

}