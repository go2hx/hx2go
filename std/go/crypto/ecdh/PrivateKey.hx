package go.crypto.ecdh;

@:structInit
@:go.Type({ name: "PrivateKey", instanceName: "ecdh.PrivateKey", imports: ["crypto/ecdh"] })
extern class PrivateKey {

    @:native("Bytes") function bytes(): go.Slice<go.Byte>;
    @:native("Curve") function curve(): go.crypto.ecdh.Curve;
    @:native("ECDH") function ECDH(remote: go.Pointer<go.crypto.ecdh.PublicKey>): go.Result<go.Slice<go.Byte>>;
    @:native("Equal") function equal(x: go.crypto.PrivateKey): Bool;
    @:native("Public") function _public(): go.crypto.PublicKey;
    @:native("PublicKey") function publicKey(): go.Pointer<go.crypto.ecdh.PublicKey>;

}