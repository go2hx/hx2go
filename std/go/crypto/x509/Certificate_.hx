package go.crypto.x509;

@:structInit
@:go.Type({ name: "certificate", instanceName: "x509.certificate", imports: ["crypto/x509"] })
extern class Certificate_ {

    @:native("TBSCertificate") var tBSCertificate: go.crypto.x509.TbsCertificate;
    @:native("SignatureAlgorithm") var signatureAlgorithm: go.crypto.x509.pkix.AlgorithmIdentifier;
    @:native("SignatureValue") var signatureValue: go.encoding.asn1.BitString;

    function new(tBSCertificate: go.crypto.x509.TbsCertificate, signatureAlgorithm: go.crypto.x509.pkix.AlgorithmIdentifier, signatureValue: go.encoding.asn1.BitString);

}