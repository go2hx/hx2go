package go.crypto.internal.fips140.ecdh;

@:structInit
@:go.Type({ name: "PrivateKey", instanceName: "ecdh.PrivateKey", imports: ["crypto/internal/fips140/ecdh"] })
extern class PrivateKey {

    @:native("Bytes") function bytes(): go.Slice<go.Byte>;
    @:native("PublicKey") function publicKey(): go.Pointer<go.crypto.internal.fips140.ecdh.PublicKey>;

}