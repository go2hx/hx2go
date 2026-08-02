package go.crypto.x509;

@:structInit
@:go.Type({ name: "certificateList", instanceName: "x509.certificateList", imports: ["crypto/x509"] })
extern class CertificateList {

    @:native("TBSCertList") var tBSCertList: go.crypto.x509.TbsCertificateList;
    @:native("SignatureAlgorithm") var signatureAlgorithm: go.crypto.x509.pkix.AlgorithmIdentifier;
    @:native("SignatureValue") var signatureValue: go.encoding.asn1.BitString;

    function new(tBSCertList: go.crypto.x509.TbsCertificateList, signatureAlgorithm: go.crypto.x509.pkix.AlgorithmIdentifier, signatureValue: go.encoding.asn1.BitString);

}