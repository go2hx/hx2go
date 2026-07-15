package go.crypto.internal.fips140.tls13;

@:structInit
@:go.Type({ name: "MasterSecret", instanceName: "tls13.MasterSecret", imports: ["crypto/internal/fips140/tls13"] })
extern class MasterSecret {

    @:native("ClientApplicationTrafficSecret") function clientApplicationTrafficSecret(transcript: go.hash.Hash): go.Slice<go.Byte>;
    @:native("ExporterMasterSecret") function exporterMasterSecret(transcript: go.hash.Hash): go.Pointer<go.crypto.internal.fips140.tls13.ExporterMasterSecret>;
    @:native("ResumptionMasterSecret") function resumptionMasterSecret(transcript: go.hash.Hash): go.Slice<go.Byte>;
    @:native("ServerApplicationTrafficSecret") function serverApplicationTrafficSecret(transcript: go.hash.Hash): go.Slice<go.Byte>;

}