package go.crypto.tls;

@:structInit
@:go.Type({ name: "Config", instanceName: "tls.Config", imports: ["crypto/tls"] })
extern class Config {

    @:native("Rand") var rand: go.io.Reader;
    @:native("Time") var time: () -> (go.time.Time);
    @:native("Certificates") var certificates: go.Slice<go.crypto.tls.Certificate>;
    @:native("NameToCertificate") var nameToCertificate: go.Map<String, go.Pointer<go.crypto.tls.Certificate>>;
    @:native("GetCertificate") var getCertificate: (p0: go.Pointer<go.crypto.tls.ClientHelloInfo>) -> (go.Result<go.Pointer<go.crypto.tls.Certificate>>);
    @:native("GetClientCertificate") var getClientCertificate: (p0: go.Pointer<go.crypto.tls.CertificateRequestInfo>) -> (go.Result<go.Pointer<go.crypto.tls.Certificate>>);
    @:native("GetConfigForClient") var getConfigForClient: (p0: go.Pointer<go.crypto.tls.ClientHelloInfo>) -> (go.Result<go.Pointer<go.crypto.tls.Config>>);
    @:native("VerifyPeerCertificate") var verifyPeerCertificate: (rawCerts: go.Slice<go.Slice<go.Byte>>, verifiedChains: go.Slice<go.Slice<go.Pointer<go.crypto.x509.Certificate>>>) -> (go.Error);
    @:native("VerifyConnection") var verifyConnection: (p0: go.crypto.tls.ConnectionState) -> (go.Error);
    @:native("RootCAs") var rootCAs: go.Pointer<go.crypto.x509.CertPool>;
    @:native("NextProtos") var nextProtos: go.Slice<String>;
    @:native("ServerName") var serverName: String;
    @:native("ClientAuth") var clientAuth: go.crypto.tls.ClientAuthType;
    @:native("ClientCAs") var clientCAs: go.Pointer<go.crypto.x509.CertPool>;
    @:native("InsecureSkipVerify") var insecureSkipVerify: Bool;
    @:native("CipherSuites") var cipherSuites: go.Slice<go.UInt16>;
    @:native("PreferServerCipherSuites") var preferServerCipherSuites: Bool;
    @:native("SessionTicketsDisabled") var sessionTicketsDisabled: Bool;
    @:native("SessionTicketKey") var sessionTicketKey: go.GoArray<go.Byte, 32>;
    @:native("ClientSessionCache") var clientSessionCache: go.crypto.tls.ClientSessionCache;
    @:native("UnwrapSession") var unwrapSession: (identity: go.Slice<go.Byte>, cs: go.crypto.tls.ConnectionState) -> (go.Result<go.Pointer<go.crypto.tls.SessionState>>);
    @:native("WrapSession") var wrapSession: (p0: go.crypto.tls.ConnectionState, p1: go.Pointer<go.crypto.tls.SessionState>) -> (go.Result<go.Slice<go.Byte>>);
    @:native("MinVersion") var minVersion: go.UInt16;
    @:native("MaxVersion") var maxVersion: go.UInt16;
    @:native("CurvePreferences") var curvePreferences: go.Slice<go.crypto.tls.CurveID>;
    @:native("DynamicRecordSizingDisabled") var dynamicRecordSizingDisabled: Bool;
    @:native("Renegotiation") var renegotiation: go.crypto.tls.RenegotiationSupport;
    @:native("KeyLogWriter") var keyLogWriter: go.io.Writer;
    @:native("EncryptedClientHelloConfigList") var encryptedClientHelloConfigList: go.Slice<go.Byte>;
    @:native("EncryptedClientHelloRejectionVerify") var encryptedClientHelloRejectionVerify: (p0: go.crypto.tls.ConnectionState) -> (go.Error);
    @:native("GetEncryptedClientHelloKeys") var getEncryptedClientHelloKeys: (p0: go.Pointer<go.crypto.tls.ClientHelloInfo>) -> (go.Result<go.Slice<go.crypto.tls.EncryptedClientHelloKey>>);
    @:native("EncryptedClientHelloKeys") var encryptedClientHelloKeys: go.Slice<go.crypto.tls.EncryptedClientHelloKey>;

    function new(rand: go.io.Reader=null, time: () -> (go.time.Time)=null, certificates: go.Slice<go.crypto.tls.Certificate>=null, nameToCertificate: go.Map<String, go.Pointer<go.crypto.tls.Certificate>>=null, getCertificate: (p0: go.Pointer<go.crypto.tls.ClientHelloInfo>) -> (go.Result<go.Pointer<go.crypto.tls.Certificate>>)=null, getClientCertificate: (p0: go.Pointer<go.crypto.tls.CertificateRequestInfo>) -> (go.Result<go.Pointer<go.crypto.tls.Certificate>>)=null, getConfigForClient: (p0: go.Pointer<go.crypto.tls.ClientHelloInfo>) -> (go.Result<go.Pointer<go.crypto.tls.Config>>)=null, verifyPeerCertificate: (rawCerts: go.Slice<go.Slice<go.Byte>>, verifiedChains: go.Slice<go.Slice<go.Pointer<go.crypto.x509.Certificate>>>) -> (go.Error)=null, verifyConnection: (p0: go.crypto.tls.ConnectionState) -> (go.Error)=null, rootCAs: go.Pointer<go.crypto.x509.CertPool>=null, nextProtos: go.Slice<String>=null, serverName: String="", clientAuth: go.crypto.tls.ClientAuthType=cast 0, clientCAs: go.Pointer<go.crypto.x509.CertPool>=null, insecureSkipVerify: Bool=false, cipherSuites: go.Slice<go.UInt16>=null, preferServerCipherSuites: Bool=false, sessionTicketsDisabled: Bool=false, sessionTicketKey: go.GoArray<go.Byte, 32>, clientSessionCache: go.crypto.tls.ClientSessionCache=null, unwrapSession: (identity: go.Slice<go.Byte>, cs: go.crypto.tls.ConnectionState) -> (go.Result<go.Pointer<go.crypto.tls.SessionState>>)=null, wrapSession: (p0: go.crypto.tls.ConnectionState, p1: go.Pointer<go.crypto.tls.SessionState>) -> (go.Result<go.Slice<go.Byte>>)=null, minVersion: go.UInt16=0, maxVersion: go.UInt16=0, curvePreferences: go.Slice<go.crypto.tls.CurveID>=null, dynamicRecordSizingDisabled: Bool=false, renegotiation: go.crypto.tls.RenegotiationSupport=cast 0, keyLogWriter: go.io.Writer=null, encryptedClientHelloConfigList: go.Slice<go.Byte>=null, encryptedClientHelloRejectionVerify: (p0: go.crypto.tls.ConnectionState) -> (go.Error)=null, getEncryptedClientHelloKeys: (p0: go.Pointer<go.crypto.tls.ClientHelloInfo>) -> (go.Result<go.Slice<go.crypto.tls.EncryptedClientHelloKey>>)=null, encryptedClientHelloKeys: go.Slice<go.crypto.tls.EncryptedClientHelloKey>=null);

    @:native("BuildNameToCertificate") function buildNameToCertificate(): Void;
    @:native("Clone") function clone(): (go.Pointer<go.crypto.tls.Config>);
    @:native("DecryptTicket") function decryptTicket(identity: go.Slice<go.Byte>, cs: go.crypto.tls.ConnectionState): (go.Result<go.Pointer<go.crypto.tls.SessionState>>);
    @:native("EncryptTicket") function encryptTicket(cs: go.crypto.tls.ConnectionState, ss: go.Pointer<go.crypto.tls.SessionState>): (go.Result<go.Slice<go.Byte>>);
    @:native("SetSessionTicketKeys") function setSessionTicketKeys(keys: go.Slice<go.GoArray<go.Byte, 32>>): Void;

}