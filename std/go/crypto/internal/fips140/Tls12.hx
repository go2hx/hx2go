package go.crypto.internal.fips140;

@:go.Type({ name: "tls12", instanceName: "tls12.tls12", imports: ["crypto/internal/fips140/tls12"] })
extern class Tls12 {

    @:native("MasterSecret") static function masterSecret<H: go.hash.Hash>(hash: () -> H, preMasterSecret: go.Slice<go.Byte>, transcript: go.Slice<go.Byte>): go.Slice<go.Byte>;
    @:native("PRF") static function PRF<H: go.hash.Hash>(hash: () -> H, secret: go.Slice<go.Byte>, label: String, seed: go.Slice<go.Byte>, keyLen: go.GoInt): go.Slice<go.Byte>;

}