package go.crypto.internal.fips140.ecdsa;

@:structInit
@:go.Type({ name: "PrivateKey", instanceName: "ecdsa.PrivateKey", imports: ["crypto/internal/fips140/ecdsa"] })
extern class PrivateKey {

    @:native("Bytes") function bytes(): go.Slice<go.Byte>;
    @:native("PublicKey") function publicKey(): go.Pointer<go.crypto.internal.fips140.ecdsa.PublicKey>;

}