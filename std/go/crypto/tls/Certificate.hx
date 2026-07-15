package go.crypto.tls;

@:structInit
@:go.Type({ name: "Certificate", instanceName: "tls.Certificate", imports: ["crypto/tls"] })
extern class Certificate {

    @:native("Certificate") var certificate: go.Slice<go.Slice<go.Byte>>;
    @:native("PrivateKey") var privateKey: go.crypto.PrivateKey;
    @:native("SupportedSignatureAlgorithms") var supportedSignatureAlgorithms: go.Slice<go.crypto.tls.SignatureScheme>;
    @:native("OCSPStaple") var oCSPStaple: go.Slice<go.Byte>;
    @:native("SignedCertificateTimestamps") var signedCertificateTimestamps: go.Slice<go.Slice<go.Byte>>;
    @:native("Leaf") var leaf: go.Pointer<go.crypto.x509.Certificate>;

function new(certificate: go.Slice<go.Slice<go.Byte>>, privateKey: go.crypto.PrivateKey, supportedSignatureAlgorithms: go.Slice<go.crypto.tls.SignatureScheme>, oCSPStaple: go.Slice<go.Byte>, signedCertificateTimestamps: go.Slice<go.Slice<go.Byte>>, leaf: go.Pointer<go.crypto.x509.Certificate>);

}