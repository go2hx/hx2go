package go.crypto.tls;

@:structInit
@:go.Type({ name: "CertificateVerificationError", instanceName: "tls.CertificateVerificationError", imports: ["crypto/tls"] })
extern class CertificateVerificationError {

    @:native("UnverifiedCertificates") var unverifiedCertificates: go.Slice<go.Pointer<go.crypto.x509.Certificate>>;
    @:native("Err") var err: go.Error;

function new(unverifiedCertificates: go.Slice<go.Pointer<go.crypto.x509.Certificate>>, err: go.Error);

    @:native("Error") function error(): String;
    @:native("Unwrap") function unwrap(): go.Error;

}