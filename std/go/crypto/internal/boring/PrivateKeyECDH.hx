package go.crypto.internal.boring;

@:structInit
@:go.Type({ name: "PrivateKeyECDH", instanceName: "boring.PrivateKeyECDH", imports: ["crypto/internal/boring"] })
extern class PrivateKeyECDH {

    @:native("PublicKey") function publicKey(): go.Result<go.Pointer<go.crypto.internal.boring.PublicKeyECDH>>;

}