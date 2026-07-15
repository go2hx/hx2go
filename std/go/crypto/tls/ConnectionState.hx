package go.crypto.tls;

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

function new(version: go.UInt16, handshakeComplete: Bool, didResume: Bool, cipherSuite: go.UInt16, curveID: go.crypto.tls.CurveID, negotiatedProtocol: String, negotiatedProtocolIsMutual: Bool, serverName: String, peerCertificates: go.Slice<go.Pointer<go.crypto.x509.Certificate>>, verifiedChains: go.Slice<go.Slice<go.Pointer<go.crypto.x509.Certificate>>>, signedCertificateTimestamps: go.Slice<go.Slice<go.Byte>>, oCSPResponse: go.Slice<go.Byte>, tLSUnique: go.Slice<go.Byte>, eCHAccepted: Bool, helloRetryRequest: Bool);

    @:native("ExportKeyingMaterial") function exportKeyingMaterial(label: String, context: go.Slice<go.Byte>, length: go.GoInt): go.Result<go.Slice<go.Byte>>;

}