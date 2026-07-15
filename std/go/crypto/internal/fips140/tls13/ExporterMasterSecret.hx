package go.crypto.internal.fips140.tls13;

@:structInit
@:go.Type({ name: "ExporterMasterSecret", instanceName: "tls13.ExporterMasterSecret", imports: ["crypto/internal/fips140/tls13"] })
extern class ExporterMasterSecret {

    @:native("Exporter") function exporter(label: String, context: go.Slice<go.Byte>, length: go.GoInt): go.Slice<go.Byte>;

}