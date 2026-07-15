package go.crypto.internal.fips140.ed25519;

@:structInit
@:go.Type({ name: "PrivateKey", instanceName: "ed25519.PrivateKey", imports: ["crypto/internal/fips140/ed25519"] })
extern class PrivateKey {

    @:native("Bytes") function bytes(): go.Slice<go.Byte>;
    @:native("PublicKey") function publicKey(): go.Slice<go.Byte>;
    @:native("Seed") function seed(): go.Slice<go.Byte>;

}