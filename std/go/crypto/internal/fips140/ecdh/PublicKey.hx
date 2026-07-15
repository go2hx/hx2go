package go.crypto.internal.fips140.ecdh;

@:structInit
@:go.Type({ name: "PublicKey", instanceName: "ecdh.PublicKey", imports: ["crypto/internal/fips140/ecdh"] })
extern class PublicKey {

    @:native("Bytes") function bytes(): go.Slice<go.Byte>;

}