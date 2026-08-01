package go.crypto.x509;

@:structInit
@:go.Type({ name: "certificateRequest", instanceName: "x509.certificateRequest", imports: ["crypto/x509"] })
extern class CertificateRequest_ {

    @:native("Raw") var raw: go.encoding.asn1.RawContent;
    @:native("TBSCSR") var TBSCSR: go.crypto.x509.TbsCertificateRequest;
    @:native("SignatureAlgorithm") var signatureAlgorithm: go.crypto.x509.pkix.AlgorithmIdentifier;
    @:native("SignatureValue") var signatureValue: go.encoding.asn1.BitString;

    function new(raw: go.encoding.asn1.RawContent, TBSCSR: go.crypto.x509.TbsCertificateRequest, signatureAlgorithm: go.crypto.x509.pkix.AlgorithmIdentifier, signatureValue: go.encoding.asn1.BitString);

}