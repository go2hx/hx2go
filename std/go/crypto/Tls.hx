package go.crypto;

/**
    Package tls partially implements TLS 1.2, as specified in RFC 5246,
    and TLS 1.3, as specified in RFC 8446.
    
    # FIPS 140-3 mode
    
    When the program is in [FIPS 140-3 mode], this package behaves as if only
    SP 800-140C and SP 800-140D approved protocol versions, cipher suites,
    signature algorithms, certificate public key types and sizes, and key
    exchange and derivation algorithms were implemented. Others are silently
    ignored and not negotiated, or rejected. This set may depend on the
    algorithms supported by the FIPS 140-3 Go Cryptographic Module selected with
    GOFIPS140, and may change across Go versions.
    
    [FIPS 140-3 mode]: https://go.dev/doc/security/fips140
**/
@:go.Type({ name: "tls", instanceName: "tls.tls", imports: ["crypto/tls"] })
extern class Tls {

    @:native("CurveP256") static var curveP256: go.crypto.tls.CurveID;
    @:native("CurveP384") static var curveP384: go.crypto.tls.CurveID;
    @:native("CurveP521") static var curveP521: go.crypto.tls.CurveID;
    @:native("ECDSAWithP256AndSHA256") static var eCDSAWithP256AndSHA256: go.crypto.tls.SignatureScheme;
    @:native("ECDSAWithP384AndSHA384") static var eCDSAWithP384AndSHA384: go.crypto.tls.SignatureScheme;
    @:native("ECDSAWithP521AndSHA512") static var eCDSAWithP521AndSHA512: go.crypto.tls.SignatureScheme;
    @:native("ECDSAWithSHA1") static var eCDSAWithSHA1: go.crypto.tls.SignatureScheme;
    @:native("Ed25519") static var ed25519: go.crypto.tls.SignatureScheme;
    @:native("NoClientCert") static var noClientCert: go.crypto.tls.ClientAuthType;
    @:native("PKCS1WithSHA1") static var pKCS1WithSHA1: go.crypto.tls.SignatureScheme;
    @:native("PKCS1WithSHA256") static var pKCS1WithSHA256: go.crypto.tls.SignatureScheme;
    @:native("PKCS1WithSHA384") static var pKCS1WithSHA384: go.crypto.tls.SignatureScheme;
    @:native("PKCS1WithSHA512") static var pKCS1WithSHA512: go.crypto.tls.SignatureScheme;
    @:native("PSSWithSHA256") static var pSSWithSHA256: go.crypto.tls.SignatureScheme;
    @:native("PSSWithSHA384") static var pSSWithSHA384: go.crypto.tls.SignatureScheme;
    @:native("PSSWithSHA512") static var pSSWithSHA512: go.crypto.tls.SignatureScheme;
    @:native("QUICEncryptionLevelApplication") static var qUICEncryptionLevelApplication: go.crypto.tls.QUICEncryptionLevel;
    @:native("QUICEncryptionLevelEarly") static var qUICEncryptionLevelEarly: go.crypto.tls.QUICEncryptionLevel;
    @:native("QUICEncryptionLevelHandshake") static var qUICEncryptionLevelHandshake: go.crypto.tls.QUICEncryptionLevel;
    @:native("QUICEncryptionLevelInitial") static var qUICEncryptionLevelInitial: go.crypto.tls.QUICEncryptionLevel;
    @:native("QUICErrorEvent") static var qUICErrorEvent: go.crypto.tls.QUICEventKind;
    @:native("QUICHandshakeDone") static var qUICHandshakeDone: go.crypto.tls.QUICEventKind;
    @:native("QUICNoEvent") static var qUICNoEvent: go.crypto.tls.QUICEventKind;
    @:native("QUICRejectedEarlyData") static var qUICRejectedEarlyData: go.crypto.tls.QUICEventKind;
    @:native("QUICResumeSession") static var qUICResumeSession: go.crypto.tls.QUICEventKind;
    @:native("QUICSetReadSecret") static var qUICSetReadSecret: go.crypto.tls.QUICEventKind;
    @:native("QUICSetWriteSecret") static var qUICSetWriteSecret: go.crypto.tls.QUICEventKind;
    @:native("QUICStoreSession") static var qUICStoreSession: go.crypto.tls.QUICEventKind;
    @:native("QUICTransportParameters") static var qUICTransportParameters: go.crypto.tls.QUICEventKind;
    @:native("QUICTransportParametersRequired") static var qUICTransportParametersRequired: go.crypto.tls.QUICEventKind;
    @:native("QUICWriteData") static var qUICWriteData: go.crypto.tls.QUICEventKind;
    @:native("RenegotiateFreelyAsClient") static var renegotiateFreelyAsClient: go.crypto.tls.RenegotiationSupport;
    @:native("RenegotiateNever") static var renegotiateNever: go.crypto.tls.RenegotiationSupport;
    @:native("RenegotiateOnceAsClient") static var renegotiateOnceAsClient: go.crypto.tls.RenegotiationSupport;
    @:native("RequestClientCert") static var requestClientCert: go.crypto.tls.ClientAuthType;
    @:native("RequireAndVerifyClientCert") static var requireAndVerifyClientCert: go.crypto.tls.ClientAuthType;
    @:native("RequireAnyClientCert") static var requireAnyClientCert: go.crypto.tls.ClientAuthType;
    @:native("SecP256r1MLKEM768") static var secP256r1MLKEM768: go.crypto.tls.CurveID;
    @:native("SecP384r1MLKEM1024") static var secP384r1MLKEM1024: go.crypto.tls.CurveID;
    /**
        A list of cipher suite IDs that are, or have been, implemented by this
        package.
        
        See https://www.iana.org/assignments/tls-parameters/tls-parameters.xml
    **/
    @:native("TLS_AES_128_GCM_SHA256") static var TLS_AES_128_GCM_SHA256: go.UInt16;
    /**
        A list of cipher suite IDs that are, or have been, implemented by this
        package.
        
        See https://www.iana.org/assignments/tls-parameters/tls-parameters.xml
    **/
    @:native("TLS_AES_256_GCM_SHA384") static var TLS_AES_256_GCM_SHA384: go.UInt16;
    /**
        A list of cipher suite IDs that are, or have been, implemented by this
        package.
        
        See https://www.iana.org/assignments/tls-parameters/tls-parameters.xml
    **/
    @:native("TLS_CHACHA20_POLY1305_SHA256") static var TLS_CHACHA20_POLY1305_SHA256: go.UInt16;
    /**
        A list of cipher suite IDs that are, or have been, implemented by this
        package.
        
        See https://www.iana.org/assignments/tls-parameters/tls-parameters.xml
    **/
    @:native("TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA") static var TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA: go.UInt16;
    /**
        A list of cipher suite IDs that are, or have been, implemented by this
        package.
        
        See https://www.iana.org/assignments/tls-parameters/tls-parameters.xml
    **/
    @:native("TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256") static var TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256: go.UInt16;
    /**
        A list of cipher suite IDs that are, or have been, implemented by this
        package.
        
        See https://www.iana.org/assignments/tls-parameters/tls-parameters.xml
    **/
    @:native("TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256") static var TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256: go.UInt16;
    /**
        A list of cipher suite IDs that are, or have been, implemented by this
        package.
        
        See https://www.iana.org/assignments/tls-parameters/tls-parameters.xml
    **/
    @:native("TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA") static var TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA: go.UInt16;
    /**
        A list of cipher suite IDs that are, or have been, implemented by this
        package.
        
        See https://www.iana.org/assignments/tls-parameters/tls-parameters.xml
    **/
    @:native("TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384") static var TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384: go.UInt16;
    /**
        A list of cipher suite IDs that are, or have been, implemented by this
        package.
        
        See https://www.iana.org/assignments/tls-parameters/tls-parameters.xml
    **/
    @:native("TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305") static var TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305: go.UInt16;
    /**
        A list of cipher suite IDs that are, or have been, implemented by this
        package.
        
        See https://www.iana.org/assignments/tls-parameters/tls-parameters.xml
    **/
    @:native("TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256") static var TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256: go.UInt16;
    /**
        A list of cipher suite IDs that are, or have been, implemented by this
        package.
        
        See https://www.iana.org/assignments/tls-parameters/tls-parameters.xml
    **/
    @:native("TLS_ECDHE_ECDSA_WITH_RC4_128_SHA") static var TLS_ECDHE_ECDSA_WITH_RC4_128_SHA: go.UInt16;
    /**
        A list of cipher suite IDs that are, or have been, implemented by this
        package.
        
        See https://www.iana.org/assignments/tls-parameters/tls-parameters.xml
    **/
    @:native("TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA") static var TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA: go.UInt16;
    /**
        A list of cipher suite IDs that are, or have been, implemented by this
        package.
        
        See https://www.iana.org/assignments/tls-parameters/tls-parameters.xml
    **/
    @:native("TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA") static var TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA: go.UInt16;
    /**
        A list of cipher suite IDs that are, or have been, implemented by this
        package.
        
        See https://www.iana.org/assignments/tls-parameters/tls-parameters.xml
    **/
    @:native("TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256") static var TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256: go.UInt16;
    /**
        A list of cipher suite IDs that are, or have been, implemented by this
        package.
        
        See https://www.iana.org/assignments/tls-parameters/tls-parameters.xml
    **/
    @:native("TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256") static var TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256: go.UInt16;
    /**
        A list of cipher suite IDs that are, or have been, implemented by this
        package.
        
        See https://www.iana.org/assignments/tls-parameters/tls-parameters.xml
    **/
    @:native("TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA") static var TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA: go.UInt16;
    /**
        A list of cipher suite IDs that are, or have been, implemented by this
        package.
        
        See https://www.iana.org/assignments/tls-parameters/tls-parameters.xml
    **/
    @:native("TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384") static var TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384: go.UInt16;
    /**
        A list of cipher suite IDs that are, or have been, implemented by this
        package.
        
        See https://www.iana.org/assignments/tls-parameters/tls-parameters.xml
    **/
    @:native("TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305") static var TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305: go.UInt16;
    /**
        A list of cipher suite IDs that are, or have been, implemented by this
        package.
        
        See https://www.iana.org/assignments/tls-parameters/tls-parameters.xml
    **/
    @:native("TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256") static var TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256: go.UInt16;
    /**
        A list of cipher suite IDs that are, or have been, implemented by this
        package.
        
        See https://www.iana.org/assignments/tls-parameters/tls-parameters.xml
    **/
    @:native("TLS_ECDHE_RSA_WITH_RC4_128_SHA") static var TLS_ECDHE_RSA_WITH_RC4_128_SHA: go.UInt16;
    /**
        A list of cipher suite IDs that are, or have been, implemented by this
        package.
        
        See https://www.iana.org/assignments/tls-parameters/tls-parameters.xml
    **/
    @:native("TLS_FALLBACK_SCSV") static var TLS_FALLBACK_SCSV: go.UInt16;
    /**
        A list of cipher suite IDs that are, or have been, implemented by this
        package.
        
        See https://www.iana.org/assignments/tls-parameters/tls-parameters.xml
    **/
    @:native("TLS_RSA_WITH_3DES_EDE_CBC_SHA") static var TLS_RSA_WITH_3DES_EDE_CBC_SHA: go.UInt16;
    /**
        A list of cipher suite IDs that are, or have been, implemented by this
        package.
        
        See https://www.iana.org/assignments/tls-parameters/tls-parameters.xml
    **/
    @:native("TLS_RSA_WITH_AES_128_CBC_SHA") static var TLS_RSA_WITH_AES_128_CBC_SHA: go.UInt16;
    /**
        A list of cipher suite IDs that are, or have been, implemented by this
        package.
        
        See https://www.iana.org/assignments/tls-parameters/tls-parameters.xml
    **/
    @:native("TLS_RSA_WITH_AES_128_CBC_SHA256") static var TLS_RSA_WITH_AES_128_CBC_SHA256: go.UInt16;
    /**
        A list of cipher suite IDs that are, or have been, implemented by this
        package.
        
        See https://www.iana.org/assignments/tls-parameters/tls-parameters.xml
    **/
    @:native("TLS_RSA_WITH_AES_128_GCM_SHA256") static var TLS_RSA_WITH_AES_128_GCM_SHA256: go.UInt16;
    /**
        A list of cipher suite IDs that are, or have been, implemented by this
        package.
        
        See https://www.iana.org/assignments/tls-parameters/tls-parameters.xml
    **/
    @:native("TLS_RSA_WITH_AES_256_CBC_SHA") static var TLS_RSA_WITH_AES_256_CBC_SHA: go.UInt16;
    /**
        A list of cipher suite IDs that are, or have been, implemented by this
        package.
        
        See https://www.iana.org/assignments/tls-parameters/tls-parameters.xml
    **/
    @:native("TLS_RSA_WITH_AES_256_GCM_SHA384") static var TLS_RSA_WITH_AES_256_GCM_SHA384: go.UInt16;
    /**
        A list of cipher suite IDs that are, or have been, implemented by this
        package.
        
        See https://www.iana.org/assignments/tls-parameters/tls-parameters.xml
    **/
    @:native("TLS_RSA_WITH_RC4_128_SHA") static var TLS_RSA_WITH_RC4_128_SHA: go.UInt16;
    @:native("VerifyClientCertIfGiven") static var verifyClientCertIfGiven: go.crypto.tls.ClientAuthType;
    @:native("VersionSSL30") static var versionSSL30: go.GoInt;
    @:native("VersionTLS10") static var versionTLS10: go.GoInt;
    @:native("VersionTLS11") static var versionTLS11: go.GoInt;
    @:native("VersionTLS12") static var versionTLS12: go.GoInt;
    @:native("VersionTLS13") static var versionTLS13: go.GoInt;
    @:native("X25519") static var X25519: go.crypto.tls.CurveID;
    @:native("X25519MLKEM768") static var X25519MLKEM768: go.crypto.tls.CurveID;

    /**
        CipherSuiteName returns the standard name for the passed cipher suite ID
        (e.g. "TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256"), or a fallback representation
        of the ID value if the cipher suite is not implemented by this package.
    **/
    @:native("CipherSuiteName") static function cipherSuiteName(id: go.UInt16): (String);
    /**
        CipherSuites returns a list of cipher suites currently implemented by this
        package, excluding those with security issues, which are returned by
        [InsecureCipherSuites].
        
        The list is sorted by ID. Note that the default cipher suites selected by
        this package might depend on logic that can't be captured by a static list,
        and might not match those returned by this function.
    **/
    @:native("CipherSuites") static function cipherSuites(): (go.Slice<go.Pointer<go.crypto.tls.CipherSuite>>);
    /**
        Client returns a new TLS client side connection
        using conn as the underlying transport.
        The config cannot be nil: users must set either ServerName or
        InsecureSkipVerify in the config.
    **/
    @:native("Client") static function client(conn: go.net.Conn, config: go.Pointer<go.crypto.tls.Config>): (go.Pointer<go.crypto.tls.Conn>);
    /**
        Dial connects to the given network address using net.Dial
        and then initiates a TLS handshake, returning the resulting
        TLS connection.
        Dial interprets a nil configuration as equivalent to
        the zero configuration; see the documentation of Config
        for the defaults.
    **/
    @:native("Dial") static function dial(network: String, addr: String, config: go.Pointer<go.crypto.tls.Config>): (go.Result<go.Pointer<go.crypto.tls.Conn>>);
    /**
        DialWithDialer connects to the given network address using dialer.Dial and
        then initiates a TLS handshake, returning the resulting TLS connection. Any
        timeout or deadline given in the dialer apply to connection and TLS
        handshake as a whole.
        
        DialWithDialer interprets a nil configuration as equivalent to the zero
        configuration; see the documentation of [Config] for the defaults.
        
        DialWithDialer uses context.Background internally; to specify the context,
        use [Dialer.DialContext] with NetDialer set to the desired dialer.
    **/
    @:native("DialWithDialer") static function dialWithDialer(dialer: go.Pointer<go.net.Dialer>, network: String, addr: String, config: go.Pointer<go.crypto.tls.Config>): (go.Result<go.Pointer<go.crypto.tls.Conn>>);
    /**
        InsecureCipherSuites returns a list of cipher suites currently implemented by
        this package and which have security issues.
        
        Most applications should not use the cipher suites in this list, and should
        only use those returned by [CipherSuites].
    **/
    @:native("InsecureCipherSuites") static function insecureCipherSuites(): (go.Slice<go.Pointer<go.crypto.tls.CipherSuite>>);
    /**
        Listen creates a TLS listener accepting connections on the
        given network address using net.Listen.
        The configuration config must be non-nil and must include
        at least one certificate or else set GetCertificate.
    **/
    @:native("Listen") static function listen(network: String, laddr: String, config: go.Pointer<go.crypto.tls.Config>): (go.Result<go.net.Listener>);
    /**
        LoadX509KeyPair reads and parses a public/private key pair from a pair of
        files. The files must contain PEM encoded data. The certificate file may
        contain intermediate certificates following the leaf certificate to form a
        certificate chain. On successful return, Certificate.Leaf will be populated.
        
        Before Go 1.23 Certificate.Leaf was left nil, and the parsed certificate was
        discarded. This behavior can be re-enabled by setting "x509keypairleaf=0"
        in the GODEBUG environment variable.
    **/
    @:native("LoadX509KeyPair") static function loadX509KeyPair(certFile: String, keyFile: String): (go.Result<go.crypto.tls.Certificate>);
    /**
        NewLRUClientSessionCache returns a [ClientSessionCache] with the given
        capacity that uses an LRU strategy. If capacity is < 1, a default capacity
        is used instead.
    **/
    @:native("NewLRUClientSessionCache") static function newLRUClientSessionCache(capacity: go.GoInt): (go.crypto.tls.ClientSessionCache);
    /**
        NewListener creates a Listener which accepts connections from an inner
        Listener and wraps each connection with [Server].
        The configuration config must be non-nil and must include
        at least one certificate or else set GetCertificate.
    **/
    @:native("NewListener") static function newListener(inner: go.net.Listener, config: go.Pointer<go.crypto.tls.Config>): (go.net.Listener);
    /**
        NewResumptionState returns a state value that can be returned by
        [ClientSessionCache.Get] to resume a previous session.
        
        state needs to be returned by [ParseSessionState], and the ticket and session
        state must have been returned by [ClientSessionState.ResumptionState].
    **/
    @:native("NewResumptionState") static function newResumptionState(ticket: go.Slice<go.Byte>, state: go.Pointer<go.crypto.tls.SessionState>): (go.Result<go.Pointer<go.crypto.tls.ClientSessionState>>);
    /**
        ParseSessionState parses a [SessionState] encoded by [SessionState.Bytes].
    **/
    @:native("ParseSessionState") static function parseSessionState(data: go.Slice<go.Byte>): (go.Result<go.Pointer<go.crypto.tls.SessionState>>);
    /**
        QUICClient returns a new TLS client side connection using QUICTransport as the
        underlying transport. The config cannot be nil.
        
        The config's MinVersion must be at least TLS 1.3.
    **/
    @:native("QUICClient") static function qUICClient(config: go.Pointer<go.crypto.tls.QUICConfig>): (go.Pointer<go.crypto.tls.QUICConn>);
    /**
        QUICServer returns a new TLS server side connection using QUICTransport as the
        underlying transport. The config cannot be nil.
        
        The config's MinVersion must be at least TLS 1.3.
    **/
    @:native("QUICServer") static function qUICServer(config: go.Pointer<go.crypto.tls.QUICConfig>): (go.Pointer<go.crypto.tls.QUICConn>);
    /**
        Server returns a new TLS server side connection
        using conn as the underlying transport.
        The configuration config must be non-nil and must include
        at least one certificate or else set GetCertificate.
    **/
    @:native("Server") static function server(conn: go.net.Conn, config: go.Pointer<go.crypto.tls.Config>): (go.Pointer<go.crypto.tls.Conn>);
    /**
        VersionName returns the name for the provided TLS version number
        (e.g. "TLS 1.3"), or a fallback representation of the value if the
        version is not implemented by this package.
    **/
    @:native("VersionName") static function versionName(version: go.UInt16): (String);
    /**
        X509KeyPair parses a public/private key pair from a pair of
        PEM encoded data. On successful return, Certificate.Leaf will be populated.
        
        Before Go 1.23 Certificate.Leaf was left nil, and the parsed certificate was
        discarded. This behavior can be re-enabled by setting "x509keypairleaf=0"
        in the GODEBUG environment variable.
    **/
    @:native("X509KeyPair") static function x509KeyPair(certPEMBlock: go.Slice<go.Byte>, keyPEMBlock: go.Slice<go.Byte>): (go.Result<go.crypto.tls.Certificate>);

}