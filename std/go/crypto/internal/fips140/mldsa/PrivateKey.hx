package go.crypto.internal.fips140.mldsa;

@:structInit
@:go.Type({ name: "PrivateKey", instanceName: "mldsa.PrivateKey", imports: ["crypto/internal/fips140/mldsa"] })
extern class PrivateKey {

    @:native("Bytes") function bytes(): go.Slice<go.Byte>;
    @:native("Equal") function equal(x: go.Pointer<go.crypto.internal.fips140.mldsa.PrivateKey>): Bool;
    @:native("PublicKey") function publicKey(): go.Pointer<go.crypto.internal.fips140.mldsa.PublicKey>;

}