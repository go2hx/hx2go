package go.crypto.tls;

/**
    CertificateRequestInfo contains information from a server's
    CertificateRequest message, which is used to demand a certificate and proof
    of control from a client.
**/
@:structInit
@:go.Type({ name: "CertificateRequestInfo", instanceName: "tls.CertificateRequestInfo", imports: ["crypto/tls"] })
extern class CertificateRequestInfo {

    @:native("AcceptableCAs") var acceptableCAs: go.Slice<go.Slice<go.Byte>>;
    @:native("SignatureSchemes") var signatureSchemes: go.Slice<go.crypto.tls.SignatureScheme>;
    @:native("Version") var version: go.UInt16;

    function new(acceptableCAs: go.Slice<go.Slice<go.Byte>>=null, signatureSchemes: go.Slice<go.crypto.tls.SignatureScheme>=null, version: go.UInt16=0);

    /**
        Context returns the context of the handshake that is in progress.
        This context is a child of the context passed to HandshakeContext,
        if any, and is canceled when the handshake concludes.
    **/
    @:native("Context") function context(): (go.context.Context);
    /**
        SupportsCertificate returns nil if the provided certificate is supported by
        the server that sent the CertificateRequest. Otherwise, it returns an error
        describing the reason for the incompatibility.
    **/
    @:native("SupportsCertificate") function supportsCertificate(c: go.Pointer<go.crypto.tls.Certificate>): (go.Error);

}