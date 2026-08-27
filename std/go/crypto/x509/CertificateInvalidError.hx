package go.crypto.x509;

@:structInit
@:go.Type({ name: "CertificateInvalidError", instanceName: "x509.CertificateInvalidError", imports: ["crypto/x509"] })
extern class CertificateInvalidError {

    @:native("Cert") var cert: go.Pointer<go.crypto.x509.Certificate>;
    @:native("Reason") var reason: go.crypto.x509.InvalidReason;
    @:native("Detail") var detail: String;

    function new(cert: go.Pointer<go.crypto.x509.Certificate>=null, reason: go.crypto.x509.InvalidReason=cast 0, detail: String="");

    @:native("Error") function error(): (String);

}