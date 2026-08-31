package go.crypto.tls;

/**
    ClientHelloInfo contains information from a ClientHello message in order to
    guide application logic in the GetCertificate and GetConfigForClient callbacks.
**/
@:structInit
@:go.Type({ name: "ClientHelloInfo", instanceName: "tls.ClientHelloInfo", imports: ["crypto/tls"] })
extern class ClientHelloInfo {

    @:native("CipherSuites") var cipherSuites: go.Slice<go.UInt16>;
    @:native("ServerName") var serverName: String;
    @:native("SupportedCurves") var supportedCurves: go.Slice<go.crypto.tls.CurveID>;
    @:native("SupportedPoints") var supportedPoints: go.Slice<go.UInt8>;
    @:native("SignatureSchemes") var signatureSchemes: go.Slice<go.crypto.tls.SignatureScheme>;
    @:native("SupportedProtos") var supportedProtos: go.Slice<String>;
    @:native("SupportedVersions") var supportedVersions: go.Slice<go.UInt16>;
    @:native("Extensions") var extensions: go.Slice<go.UInt16>;
    @:native("Conn") var conn: go.net.Conn;
    @:native("HelloRetryRequest") var helloRetryRequest: Bool;

    function new(cipherSuites: go.Slice<go.UInt16>=null, serverName: String="", supportedCurves: go.Slice<go.crypto.tls.CurveID>=null, supportedPoints: go.Slice<go.UInt8>=null, signatureSchemes: go.Slice<go.crypto.tls.SignatureScheme>=null, supportedProtos: go.Slice<String>=null, supportedVersions: go.Slice<go.UInt16>=null, extensions: go.Slice<go.UInt16>=null, conn: go.net.Conn=null, helloRetryRequest: Bool=false);

    /**
        Context returns the context of the handshake that is in progress.
        This context is a child of the context passed to HandshakeContext,
        if any, and is canceled when the handshake concludes.
    **/
    @:native("Context") function context(): (go.context.Context);
    /**
        SupportsCertificate returns nil if the provided certificate is supported by
        the client that sent the ClientHello. Otherwise, it returns an error
        describing the reason for the incompatibility.
        
        If this [ClientHelloInfo] was passed to a GetConfigForClient or GetCertificate
        callback, this method will take into account the associated [Config]. Note that
        if GetConfigForClient returns a different [Config], the change can't be
        accounted for by this method.
        
        This function will call x509.ParseCertificate unless c.Leaf is set, which can
        incur a significant performance cost.
    **/
    @:native("SupportsCertificate") function supportsCertificate(c: go.Pointer<go.crypto.tls.Certificate>): (go.Error);

}