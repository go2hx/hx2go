package go.crypto.x509.pkix;

@:structInit
@:go.Type({ name: "CertificateList", instanceName: "pkix.CertificateList", imports: ["crypto/x509/pkix"] })
extern class CertificateList {

    @:native("TBSCertList") var tBSCertList: go.crypto.x509.pkix.TBSCertificateList;
    @:native("SignatureAlgorithm") var signatureAlgorithm: go.crypto.x509.pkix.AlgorithmIdentifier;
    @:native("SignatureValue") var signatureValue: go.encoding.asn1.BitString;

function new(tBSCertList: go.crypto.x509.pkix.TBSCertificateList, signatureAlgorithm: go.crypto.x509.pkix.AlgorithmIdentifier, signatureValue: go.encoding.asn1.BitString);

    @:native("HasExpired") function hasExpired(now: go.time.Time): Bool;

}