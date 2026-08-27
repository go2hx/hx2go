package go.crypto.x509;

@:structInit
@:go.Type({ name: "CertificateRequest", instanceName: "x509.CertificateRequest", imports: ["crypto/x509"] })
extern class CertificateRequest {

    @:native("Raw") var raw: go.Slice<go.Byte>;
    @:native("RawTBSCertificateRequest") var rawTBSCertificateRequest: go.Slice<go.Byte>;
    @:native("RawSubjectPublicKeyInfo") var rawSubjectPublicKeyInfo: go.Slice<go.Byte>;
    @:native("RawSubject") var rawSubject: go.Slice<go.Byte>;
    @:native("Version") var version: go.GoInt;
    @:native("Signature") var signature: go.Slice<go.Byte>;
    @:native("SignatureAlgorithm") var signatureAlgorithm: go.crypto.x509.SignatureAlgorithm;
    @:native("PublicKeyAlgorithm") var publicKeyAlgorithm: go.crypto.x509.PublicKeyAlgorithm;
    @:native("PublicKey") var publicKey: Dynamic;
    @:native("Subject") var subject: go.crypto.x509.pkix.Name;
    @:native("Attributes") var attributes: go.Slice<go.crypto.x509.pkix.AttributeTypeAndValueSET>;
    @:native("Extensions") var extensions: go.Slice<go.crypto.x509.pkix.Extension>;
    @:native("ExtraExtensions") var extraExtensions: go.Slice<go.crypto.x509.pkix.Extension>;
    @:native("DNSNames") var dNSNames: go.Slice<String>;
    @:native("EmailAddresses") var emailAddresses: go.Slice<String>;
    @:native("IPAddresses") var iPAddresses: go.Slice<go.net.IP>;
    @:native("URIs") var uRIs: go.Slice<go.Pointer<go.net.url.URL>>;

    function new(raw: go.Slice<go.Byte>=null, rawTBSCertificateRequest: go.Slice<go.Byte>=null, rawSubjectPublicKeyInfo: go.Slice<go.Byte>=null, rawSubject: go.Slice<go.Byte>=null, version: go.GoInt=0, signature: go.Slice<go.Byte>=null, signatureAlgorithm: go.crypto.x509.SignatureAlgorithm=cast 0, publicKeyAlgorithm: go.crypto.x509.PublicKeyAlgorithm=cast 0, publicKey: Dynamic=null, subject: go.crypto.x509.pkix.Name, attributes: go.Slice<go.crypto.x509.pkix.AttributeTypeAndValueSET>=null, extensions: go.Slice<go.crypto.x509.pkix.Extension>=null, extraExtensions: go.Slice<go.crypto.x509.pkix.Extension>=null, dNSNames: go.Slice<String>=null, emailAddresses: go.Slice<String>=null, iPAddresses: go.Slice<go.net.IP>=null, uRIs: go.Slice<go.Pointer<go.net.url.URL>>=null);

    @:native("CheckSignature") function checkSignature(): (go.Error);

}