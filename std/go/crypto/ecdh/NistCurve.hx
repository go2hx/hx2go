package go.crypto.ecdh;

@:structInit
@:go.Type({ name: "nistCurve", instanceName: "ecdh.nistCurve", imports: ["crypto/ecdh"] })
extern class NistCurve {

    @:native("GenerateKey") function generateKey(r: go.io.Reader): (go.Result<go.Pointer<go.crypto.ecdh.PrivateKey>>);
    @:native("NewPrivateKey") function newPrivateKey(key: go.Slice<go.Byte>): (go.Result<go.Pointer<go.crypto.ecdh.PrivateKey>>);
    @:native("NewPublicKey") function newPublicKey(key: go.Slice<go.Byte>): (go.Result<go.Pointer<go.crypto.ecdh.PublicKey>>);
    @:native("String") function string(): (String);

}