package go.crypto.internal.fips140.ecdsa;

@:structInit
@:go.Type({ name: "PublicKey", instanceName: "ecdsa.PublicKey", imports: ["crypto/internal/fips140/ecdsa"] })
extern class PublicKey {

    @:native("Bytes") function bytes(): go.Slice<go.Byte>;

}