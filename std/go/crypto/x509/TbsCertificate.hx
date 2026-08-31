package go.crypto.x509;

@:structInit
@:go.Type({ name: "tbsCertificate", instanceName: "x509.tbsCertificate", imports: ["crypto/x509"] })
extern class TbsCertificate {

    @:native("Raw") var raw: go.encoding.asn1.RawContent;
    @:native("Version") var version: go.GoInt;
    @:native("SerialNumber") var serialNumber: go.Pointer<go.math.big.Int>;
    @:native("SignatureAlgorithm") var signatureAlgorithm: go.crypto.x509.pkix.AlgorithmIdentifier;
    @:native("Issuer") var issuer: go.encoding.asn1.RawValue;
    @:native("Validity") var validity: go.crypto.x509.Validity;
    @:native("Subject") var subject: go.encoding.asn1.RawValue;
    @:native("PublicKey") var publicKey: go.crypto.x509.PublicKeyInfo;
    @:native("UniqueId") var uniqueId: go.encoding.asn1.BitString;
    @:native("SubjectUniqueId") var subjectUniqueId: go.encoding.asn1.BitString;
    @:native("Extensions") var extensions: go.Slice<go.crypto.x509.pkix.Extension>;

    function new(raw: go.encoding.asn1.RawContent=null, version: go.GoInt=0, serialNumber: go.Pointer<go.math.big.Int>=null, signatureAlgorithm: go.crypto.x509.pkix.AlgorithmIdentifier, issuer: go.encoding.asn1.RawValue, validity: go.crypto.x509.Validity, subject: go.encoding.asn1.RawValue, publicKey: go.crypto.x509.PublicKeyInfo, uniqueId: go.encoding.asn1.BitString, subjectUniqueId: go.encoding.asn1.BitString, extensions: go.Slice<go.crypto.x509.pkix.Extension>=null);

}