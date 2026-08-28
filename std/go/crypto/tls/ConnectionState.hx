package go.crypto.tls;

/**
    ConnectionState records basic TLS details about the connection.
**/
@:structInit
@:go.Type({ name: "ConnectionState", instanceName: "tls.ConnectionState", imports: ["crypto/tls"] })
extern class ConnectionState {

    @:native("Version") var version: go.UInt16;
    @:native("HandshakeComplete") var handshakeComplete: Bool;
    @:native("DidResume") var didResume: Bool;
    @:native("CipherSuite") var cipherSuite: go.UInt16;
    @:native("CurveID") var curveID: go.crypto.tls.CurveID;
    @:native("NegotiatedProtocol") var negotiatedProtocol: String;
    @:native("NegotiatedProtocolIsMutual") var negotiatedProtocolIsMutual: Bool;
    @:native("ServerName") var serverName: String;
    @:native("PeerCertificates") var peerCertificates: go.Slice<go.Pointer<go.crypto.x509.Certificate>>;
    @:native("VerifiedChains") var verifiedChains: go.Slice<go.Slice<go.Pointer<go.crypto.x509.Certificate>>>;
    @:native("SignedCertificateTimestamps") var signedCertificateTimestamps: go.Slice<go.Slice<go.Byte>>;
    @:native("OCSPResponse") var oCSPResponse: go.Slice<go.Byte>;
    @:native("TLSUnique") var tLSUnique: go.Slice<go.Byte>;
    @:native("ECHAccepted") var eCHAccepted: Bool;
    @:native("HelloRetryRequest") var helloRetryRequest: Bool;

    function new(version: go.UInt16=0, handshakeComplete: Bool=false, didResume: Bool=false, cipherSuite: go.UInt16=0, curveID: go.crypto.tls.CurveID=cast 0, negotiatedProtocol: String="", negotiatedProtocolIsMutual: Bool=false, serverName: String="", peerCertificates: go.Slice<go.Pointer<go.crypto.x509.Certificate>>=null, verifiedChains: go.Slice<go.Slice<go.Pointer<go.crypto.x509.Certificate>>>=null, signedCertificateTimestamps: go.Slice<go.Slice<go.Byte>>=null, oCSPResponse: go.Slice<go.Byte>=null, tLSUnique: go.Slice<go.Byte>=null, eCHAccepted: Bool=false, helloRetryRequest: Bool=false);

    /**
        ExportKeyingMaterial returns length bytes of exported key material in a new
        slice as defined in RFC 5705. If context is nil, it is not used as part of
        the seed. If the connection was set to allow renegotiation via
        Config.Renegotiation, or if the connections supports neither TLS 1.3 nor
        Extended Master Secret, this function will return an error.
        
        Exporting key material without Extended Master Secret or TLS 1.3 was disabled
        in Go 1.22 due to security issues (see the Security Considerations sections
        of RFC 5705 and RFC 7627), but can be re-enabled with the GODEBUG setting
        tlsunsafeekm=1.
    **/
    @:native("ExportKeyingMaterial") function exportKeyingMaterial(label: String, context: go.Slice<go.Byte>, length: go.GoInt): (go.Result<go.Slice<go.Byte>>);

}