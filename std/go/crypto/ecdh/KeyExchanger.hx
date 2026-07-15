package go.crypto.ecdh;

@:go.Type({ name: "KeyExchanger", instanceName: "ecdh.KeyExchanger", imports: ["crypto/ecdh"] })
extern typedef KeyExchanger = {

    @:native("Curve") function curve(): go.crypto.ecdh.Curve;
    @:native("ECDH") function ECDH(p0: go.Pointer<go.crypto.ecdh.PublicKey>): go.Result<go.Slice<go.Byte>>;
    @:native("PublicKey") function publicKey(): go.Pointer<go.crypto.ecdh.PublicKey>;

}