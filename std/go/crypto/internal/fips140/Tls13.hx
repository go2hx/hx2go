package go.crypto.internal.fips140;

@:go.Type({ name: "tls13", instanceName: "tls13.tls13", imports: ["crypto/internal/fips140/tls13"] })
extern class Tls13 {

    @:native("ExpandLabel") static function expandLabel<H: go.hash.Hash>(hash: () -> H, secret: go.Slice<go.Byte>, label: String, context: go.Slice<go.Byte>, length: go.GoInt): go.Slice<go.Byte>;
    @:native("NewEarlySecret") static function newEarlySecret<H: go.hash.Hash>(h: () -> H, psk: go.Slice<go.Byte>): go.Pointer<go.crypto.internal.fips140.tls13.EarlySecret>;
    @:native("TestingOnlyExporterSecret") static function testingOnlyExporterSecret(s: go.Pointer<go.crypto.internal.fips140.tls13.ExporterMasterSecret>): go.Slice<go.Byte>;

}