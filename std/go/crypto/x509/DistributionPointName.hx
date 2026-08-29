package go.crypto.x509;

@:structInit
@:go.Type({ name: "distributionPointName", instanceName: "x509.distributionPointName", imports: ["crypto/x509"] })
extern class DistributionPointName {

    @:native("FullName") var fullName: go.Slice<go.encoding.asn1.RawValue>;
    @:native("RelativeName") var relativeName: go.crypto.x509.pkix.RDNSequence;

    function new(fullName: go.Slice<go.encoding.asn1.RawValue>=null, relativeName: go.crypto.x509.pkix.RDNSequence=null);

}