package go.crypto.x509;

@:structInit
@:go.Type({ name: "distributionPoint", instanceName: "x509.distributionPoint", imports: ["crypto/x509"] })
extern class DistributionPoint {

    @:native("DistributionPoint") var distributionPoint: go.crypto.x509.DistributionPointName;
    @:native("Reason") var reason: go.encoding.asn1.BitString;
    @:native("CRLIssuer") var cRLIssuer: go.encoding.asn1.RawValue;

    function new(distributionPoint: go.crypto.x509.DistributionPointName, reason: go.encoding.asn1.BitString, cRLIssuer: go.encoding.asn1.RawValue);

}