package go.crypto.x509;

@:structInit
@:go.Type({ name: "PolicyMapping", instanceName: "x509.PolicyMapping", imports: ["crypto/x509"] })
extern class PolicyMapping {

    @:native("IssuerDomainPolicy") var issuerDomainPolicy: go.crypto.x509.OID;
    @:native("SubjectDomainPolicy") var subjectDomainPolicy: go.crypto.x509.OID;

function new(issuerDomainPolicy: go.crypto.x509.OID, subjectDomainPolicy: go.crypto.x509.OID);

}