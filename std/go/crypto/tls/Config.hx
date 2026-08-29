package go.crypto.tls;

/**
    A Config structure is used to configure a TLS client or server.
    After one has been passed to a TLS function it must not be
    modified. A Config may be reused; the tls package will also not
    modify it.
**/
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

    /**
        BuildNameToCertificate parses c.Certificates and builds c.NameToCertificate
        from the CommonName and SubjectAlternateName fields of each of the leaf
        certificates.
        
        Deprecated: NameToCertificate only allows associating a single certificate
        with a given name. Leave that field nil to let the library select the first
        compatible chain from Certificates.
    **/
    @:native("BuildNameToCertificate") function buildNameToCertificate(): Void;
    /**
        Clone returns a shallow clone of c or nil if c is nil. It is safe to clone a
        [Config] that is being used concurrently by a TLS client or server.
        
        The returned Config can share session ticket keys with the original Config,
        which means connections could be resumed across the two Configs. WARNING:
        [Config.VerifyPeerCertificate] does not get called on resumed connections,
        including connections that were originally established on the parent Config.
        If that is not intended, use [Config.VerifyConnection] instead, or set
        [Config.SessionTicketsDisabled].
    **/
    @:native("Clone") function clone(): (go.Pointer<go.crypto.tls.Config>);
    /**
        DecryptTicket decrypts a ticket encrypted by [Config.EncryptTicket]. It can
        be used as a [Config.UnwrapSession] implementation.
        
        If the ticket can't be decrypted or parsed, DecryptTicket returns (nil, nil).
    **/
    @:native("DecryptTicket") function decryptTicket(identity: go.Slice<go.Byte>, cs: go.crypto.tls.ConnectionState): (go.Result<go.Pointer<go.crypto.tls.SessionState>>);
    /**
        EncryptTicket encrypts a ticket with the [Config]'s configured (or default)
        session ticket keys. It can be used as a [Config.WrapSession] implementation.
    **/
    @:native("EncryptTicket") function encryptTicket(cs: go.crypto.tls.ConnectionState, ss: go.Pointer<go.crypto.tls.SessionState>): (go.Result<go.Slice<go.Byte>>);
    /**
        SetSessionTicketKeys updates the session ticket keys for a server.
        
        The first key will be used when creating new tickets, while all keys can be
        used for decrypting tickets. It is safe to call this function while the
        server is running in order to rotate the session ticket keys. The function
        will panic if keys is empty.
        
        Calling this function will turn off automatic session ticket key rotation.
        
        If multiple servers are terminating connections for the same host they should
        all have the same session ticket keys. If the session ticket keys leaks,
        previously recorded and future TLS connections using those keys might be
        compromised.
    **/
    @:native("SetSessionTicketKeys") function setSessionTicketKeys(keys: go.Slice<go.GoArray<go.Byte, 32>>): Void;

}