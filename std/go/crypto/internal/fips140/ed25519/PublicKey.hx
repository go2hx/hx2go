package go.crypto.internal.fips140.ed25519;

@:structInit
@:go.Type({ name: "PublicKey", instanceName: "ed25519.PublicKey", imports: ["crypto/internal/fips140/ed25519"] })
extern class PublicKey {

    @:native("Bytes") function bytes(): go.Slice<go.Byte>;

}