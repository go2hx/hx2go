package go.crypto.internal.fips140.tls13;

@:structInit
@:go.Type({ name: "EarlySecret", instanceName: "tls13.EarlySecret", imports: ["crypto/internal/fips140/tls13"] })
extern class EarlySecret {

    @:native("ClientEarlyTrafficSecret") function clientEarlyTrafficSecret(transcript: go.hash.Hash): go.Slice<go.Byte>;
    @:native("EarlyExporterMasterSecret") function earlyExporterMasterSecret(transcript: go.hash.Hash): go.Pointer<go.crypto.internal.fips140.tls13.ExporterMasterSecret>;
    @:native("HandshakeSecret") function handshakeSecret(sharedSecret: go.Slice<go.Byte>): go.Pointer<go.crypto.internal.fips140.tls13.HandshakeSecret>;
    @:native("ResumptionBinderKey") function resumptionBinderKey(): go.Slice<go.Byte>;

}