package go.crypto.tls;

/**
    A Certificate is a chain of one or more certificates, leaf first.
**/
@:structInit
@:go.Type({ name: "Certificate", instanceName: "tls.Certificate", imports: ["crypto/tls"] })
extern class Certificate {

    @:native("Certificate") var certificate: go.Slice<go.Slice<go.Byte>>;
    @:native("PrivateKey") var privateKey: go.crypto.PrivateKey;
    @:native("SupportedSignatureAlgorithms") var supportedSignatureAlgorithms: go.Slice<go.crypto.tls.SignatureScheme>;
    @:native("OCSPStaple") var oCSPStaple: go.Slice<go.Byte>;
    @:native("SignedCertificateTimestamps") var signedCertificateTimestamps: go.Slice<go.Slice<go.Byte>>;
    @:native("Leaf") var leaf: go.Pointer<go.crypto.x509.Certificate>;

    function new(certificate: go.Slice<go.Slice<go.Byte>>=null, privateKey: go.crypto.PrivateKey=null, supportedSignatureAlgorithms: go.Slice<go.crypto.tls.SignatureScheme>=null, oCSPStaple: go.Slice<go.Byte>=null, signedCertificateTimestamps: go.Slice<go.Slice<go.Byte>>=null, leaf: go.Pointer<go.crypto.x509.Certificate>=null);

}