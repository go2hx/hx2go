package go.crypto.tls;

@:structInit
@:go.Type({ name: "CertificateRequestInfo", instanceName: "tls.CertificateRequestInfo", imports: ["crypto/tls"] })
extern class CertificateRequestInfo {

    @:native("AcceptableCAs") var acceptableCAs: go.Slice<go.Slice<go.Byte>>;
    @:native("SignatureSchemes") var signatureSchemes: go.Slice<go.crypto.tls.SignatureScheme>;
    @:native("Version") var version: go.UInt16;

    function new(acceptableCAs: go.Slice<go.Slice<go.Byte>>=null, signatureSchemes: go.Slice<go.crypto.tls.SignatureScheme>=null, version: go.UInt16=0);

    @:native("Context") function context(): (go.context.Context);
    @:native("SupportsCertificate") function supportsCertificate(c: go.Pointer<go.crypto.tls.Certificate>): (go.Error);

}