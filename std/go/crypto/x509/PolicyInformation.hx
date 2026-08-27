package go.crypto.x509;

@:structInit
@:go.Type({ name: "policyInformation", instanceName: "x509.policyInformation", imports: ["crypto/x509"] })
extern class PolicyInformation {

    @:native("Policy") var policy: go.encoding.asn1.ObjectIdentifier;

    function new(policy: go.encoding.asn1.ObjectIdentifier=null);

}