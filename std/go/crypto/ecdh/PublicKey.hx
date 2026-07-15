package go.crypto.ecdh;

@:structInit
@:go.Type({ name: "PublicKey", instanceName: "ecdh.PublicKey", imports: ["crypto/ecdh"] })
extern class PublicKey {

    @:native("Bytes") function bytes(): go.Slice<go.Byte>;
    @:native("Curve") function curve(): go.crypto.ecdh.Curve;
    @:native("Equal") function equal(x: go.crypto.PublicKey): Bool;

}