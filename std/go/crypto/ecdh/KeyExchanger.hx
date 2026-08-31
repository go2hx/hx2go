package go.crypto.ecdh;

/**
    KeyExchanger is an interface for an opaque private key that can be used for
    key exchange operations. For example, an ECDH key kept in a hardware module.
    
    It is implemented by [PrivateKey].
**/
@:go.Type({ name: "KeyExchanger", instanceName: "ecdh.KeyExchanger", imports: ["crypto/ecdh"] })
extern typedef KeyExchanger = {

    @:native("Curve") function curve(): (go.crypto.ecdh.Curve);
    @:native("ECDH") function ECDH(p0: go.Pointer<go.crypto.ecdh.PublicKey>): (go.Result<go.Slice<go.Byte>>);
    @:native("PublicKey") function publicKey(): (go.Pointer<go.crypto.ecdh.PublicKey>);

}