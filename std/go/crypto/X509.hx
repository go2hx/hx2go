package go.crypto;

/**
    Package x509 implements a subset of the X.509 standard.
    
    It allows parsing and generating certificates, certificate signing
    requests, certificate revocation lists, and encoded public and private keys.
    It provides a certificate verifier, complete with a chain builder.
    
    The package targets the X.509 technical profile defined by the IETF (RFC
    2459/3280/5280), and as further restricted by the CA/Browser Forum Baseline
    Requirements. There is minimal support for features outside of these
    profiles, as the primary goal of the package is to provide compatibility
    with the publicly trusted TLS certificate ecosystem and its policies and
    constraints.
    
    On macOS and Windows, certificate verification is handled by system APIs, but
    the package aims to apply consistent validation rules across operating
    systems.
**/
@:go.Type({ name: "x509", instanceName: "x509.x509", imports: ["crypto/x509"] })
extern class X509 {

    @:native("CANotAuthorizedForExtKeyUsage") static var cANotAuthorizedForExtKeyUsage: go.crypto.x509.InvalidReason;
    @:native("CANotAuthorizedForThisName") static var cANotAuthorizedForThisName: go.crypto.x509.InvalidReason;
    @:native("DSA") static var DSA: go.crypto.x509.PublicKeyAlgorithm;
    @:native("DSAWithSHA1") static var dSAWithSHA1: go.crypto.x509.SignatureAlgorithm;
    @:native("DSAWithSHA256") static var dSAWithSHA256: go.crypto.x509.SignatureAlgorithm;
    @:native("ECDSA") static var ECDSA: go.crypto.x509.PublicKeyAlgorithm;
    @:native("ECDSAWithSHA1") static var eCDSAWithSHA1: go.crypto.x509.SignatureAlgorithm;
    @:native("ECDSAWithSHA256") static var eCDSAWithSHA256: go.crypto.x509.SignatureAlgorithm;
    @:native("ECDSAWithSHA384") static var eCDSAWithSHA384: go.crypto.x509.SignatureAlgorithm;
    @:native("ECDSAWithSHA512") static var eCDSAWithSHA512: go.crypto.x509.SignatureAlgorithm;
    @:native("Ed25519") static var ed25519: go.crypto.x509.PublicKeyAlgorithm;
    @:native("Expired") static var expired: go.crypto.x509.InvalidReason;
    @:native("ExtKeyUsageAny") static var extKeyUsageAny: go.crypto.x509.ExtKeyUsage;
    @:native("ExtKeyUsageClientAuth") static var extKeyUsageClientAuth: go.crypto.x509.ExtKeyUsage;
    @:native("ExtKeyUsageCodeSigning") static var extKeyUsageCodeSigning: go.crypto.x509.ExtKeyUsage;
    @:native("ExtKeyUsageEmailProtection") static var extKeyUsageEmailProtection: go.crypto.x509.ExtKeyUsage;
    @:native("ExtKeyUsageIPSECEndSystem") static var extKeyUsageIPSECEndSystem: go.crypto.x509.ExtKeyUsage;
    @:native("ExtKeyUsageIPSECTunnel") static var extKeyUsageIPSECTunnel: go.crypto.x509.ExtKeyUsage;
    @:native("ExtKeyUsageIPSECUser") static var extKeyUsageIPSECUser: go.crypto.x509.ExtKeyUsage;
    @:native("ExtKeyUsageMicrosoftCommercialCodeSigning") static var extKeyUsageMicrosoftCommercialCodeSigning: go.crypto.x509.ExtKeyUsage;
    @:native("ExtKeyUsageMicrosoftKernelCodeSigning") static var extKeyUsageMicrosoftKernelCodeSigning: go.crypto.x509.ExtKeyUsage;
    @:native("ExtKeyUsageMicrosoftServerGatedCrypto") static var extKeyUsageMicrosoftServerGatedCrypto: go.crypto.x509.ExtKeyUsage;
    @:native("ExtKeyUsageNetscapeServerGatedCrypto") static var extKeyUsageNetscapeServerGatedCrypto: go.crypto.x509.ExtKeyUsage;
    @:native("ExtKeyUsageOCSPSigning") static var extKeyUsageOCSPSigning: go.crypto.x509.ExtKeyUsage;
    @:native("ExtKeyUsageServerAuth") static var extKeyUsageServerAuth: go.crypto.x509.ExtKeyUsage;
    @:native("ExtKeyUsageTimeStamping") static var extKeyUsageTimeStamping: go.crypto.x509.ExtKeyUsage;
    @:native("IncompatibleUsage") static var incompatibleUsage: go.crypto.x509.InvalidReason;
    @:native("KeyUsageCRLSign") static var keyUsageCRLSign: go.crypto.x509.KeyUsage;
    @:native("KeyUsageCertSign") static var keyUsageCertSign: go.crypto.x509.KeyUsage;
    @:native("KeyUsageContentCommitment") static var keyUsageContentCommitment: go.crypto.x509.KeyUsage;
    @:native("KeyUsageDataEncipherment") static var keyUsageDataEncipherment: go.crypto.x509.KeyUsage;
    @:native("KeyUsageDecipherOnly") static var keyUsageDecipherOnly: go.crypto.x509.KeyUsage;
    @:native("KeyUsageDigitalSignature") static var keyUsageDigitalSignature: go.crypto.x509.KeyUsage;
    @:native("KeyUsageEncipherOnly") static var keyUsageEncipherOnly: go.crypto.x509.KeyUsage;
    @:native("KeyUsageKeyAgreement") static var keyUsageKeyAgreement: go.crypto.x509.KeyUsage;
    @:native("KeyUsageKeyEncipherment") static var keyUsageKeyEncipherment: go.crypto.x509.KeyUsage;
    @:native("MD2WithRSA") static var mD2WithRSA: go.crypto.x509.SignatureAlgorithm;
    @:native("MD5WithRSA") static var mD5WithRSA: go.crypto.x509.SignatureAlgorithm;
    @:native("NameConstraintsWithoutSANs") static var nameConstraintsWithoutSANs: go.crypto.x509.InvalidReason;
    @:native("NameMismatch") static var nameMismatch: go.crypto.x509.InvalidReason;
    @:native("NoValidChains") static var noValidChains: go.crypto.x509.InvalidReason;
    @:native("NotAuthorizedToSign") static var notAuthorizedToSign: go.crypto.x509.InvalidReason;
    /**
        Possible values for the EncryptPEMBlock encryption algorithm.
    **/
    @:native("PEMCipher3DES") static var pEMCipher3DES: go.crypto.x509.PEMCipher;
    /**
        Possible values for the EncryptPEMBlock encryption algorithm.
    **/
    @:native("PEMCipherAES128") static var pEMCipherAES128: go.crypto.x509.PEMCipher;
    /**
        Possible values for the EncryptPEMBlock encryption algorithm.
    **/
    @:native("PEMCipherAES192") static var pEMCipherAES192: go.crypto.x509.PEMCipher;
    /**
        Possible values for the EncryptPEMBlock encryption algorithm.
    **/
    @:native("PEMCipherAES256") static var pEMCipherAES256: go.crypto.x509.PEMCipher;
    /**
        Possible values for the EncryptPEMBlock encryption algorithm.
    **/
    @:native("PEMCipherDES") static var pEMCipherDES: go.crypto.x509.PEMCipher;
    @:native("PureEd25519") static var pureEd25519: go.crypto.x509.SignatureAlgorithm;
    @:native("RSA") static var RSA: go.crypto.x509.PublicKeyAlgorithm;
    @:native("SHA1WithRSA") static var sHA1WithRSA: go.crypto.x509.SignatureAlgorithm;
    @:native("SHA256WithRSA") static var sHA256WithRSA: go.crypto.x509.SignatureAlgorithm;
    @:native("SHA256WithRSAPSS") static var sHA256WithRSAPSS: go.crypto.x509.SignatureAlgorithm;
    @:native("SHA384WithRSA") static var sHA384WithRSA: go.crypto.x509.SignatureAlgorithm;
    @:native("SHA384WithRSAPSS") static var sHA384WithRSAPSS: go.crypto.x509.SignatureAlgorithm;
    @:native("SHA512WithRSA") static var sHA512WithRSA: go.crypto.x509.SignatureAlgorithm;
    @:native("SHA512WithRSAPSS") static var sHA512WithRSAPSS: go.crypto.x509.SignatureAlgorithm;
    @:native("TooManyConstraints") static var tooManyConstraints: go.crypto.x509.InvalidReason;
    @:native("TooManyIntermediates") static var tooManyIntermediates: go.crypto.x509.InvalidReason;
    @:native("UnconstrainedName") static var unconstrainedName: go.crypto.x509.InvalidReason;
    @:native("UnknownPublicKeyAlgorithm") static var unknownPublicKeyAlgorithm: go.crypto.x509.PublicKeyAlgorithm;
    @:native("UnknownSignatureAlgorithm") static var unknownSignatureAlgorithm: go.crypto.x509.SignatureAlgorithm;

    /**
        CreateCertificate creates a new X.509 v3 certificate based on a template.
        The following members of template are currently used:
        
          - AuthorityKeyId
          - BasicConstraintsValid
          - CRLDistributionPoints
          - DNSNames
          - EmailAddresses
          - ExcludedDNSDomains
          - ExcludedEmailAddresses
          - ExcludedIPRanges
          - ExcludedURIDomains
          - ExtKeyUsage
          - ExtraExtensions
          - IPAddresses
          - IsCA
          - IssuingCertificateURL
          - KeyUsage
          - MaxPathLen
          - MaxPathLenZero
          - NotAfter
          - NotBefore
          - OCSPServer
          - PermittedDNSDomains
          - PermittedDNSDomainsCritical
          - PermittedEmailAddresses
          - PermittedIPRanges
          - PermittedURIDomains
          - PolicyIdentifiers (see note below)
          - Policies (see note below)
          - SerialNumber
          - SignatureAlgorithm
          - Subject
          - SubjectKeyId
          - URIs
          - UnknownExtKeyUsage
        
        The certificate is signed by parent. If parent is equal to template then the
        certificate is self-signed. The parameter pub is the public key of the
        certificate to be generated and priv is the private key of the signer.
        
        The returned slice is the certificate in DER encoding.
        
        The currently supported key types are *rsa.PublicKey, *ecdsa.PublicKey and
        ed25519.PublicKey. pub must be a supported key type, and priv must be a
        crypto.Signer or crypto.MessageSigner with a supported public key.
        
        The AuthorityKeyId will be taken from the SubjectKeyId of parent, if any,
        unless the resulting certificate is self-signed. Otherwise the value from
        template will be used.
        
        If SubjectKeyId from template is empty and the template is a CA, SubjectKeyId
        will be generated from the hash of the public key.
        
        If template.SerialNumber is nil, a serial number will be generated which
        conforms to RFC 5280, Section 4.1.2.2 using entropy from rand.
        
        The PolicyIdentifier and Policies fields can both be used to marshal certificate
        policy OIDs. By default, only the Policies is marshaled, but if the
        GODEBUG setting "x509usepolicies" has the value "0", the PolicyIdentifiers field will
        be marshaled instead of the Policies field. This changed in Go 1.24. The Policies field can
        be used to marshal policy OIDs which have components that are larger than 31
        bits.
    **/
    @:native("CreateCertificate") static function createCertificate(rand: go.io.Reader, template: go.Pointer<go.crypto.x509.Certificate>, parent: go.Pointer<go.crypto.x509.Certificate>, pub: Dynamic, priv: Dynamic): (go.Result<go.Slice<go.Byte>>);
    /**
        CreateCertificateRequest creates a new certificate request based on a
        template. The following members of template are used:
        
          - SignatureAlgorithm
          - Subject
          - DNSNames
          - EmailAddresses
          - IPAddresses
          - URIs
          - ExtraExtensions
          - Attributes (deprecated)
        
        priv is the private key to sign the CSR with, and the corresponding public
        key will be included in the CSR. It must implement crypto.Signer or
        crypto.MessageSigner and its Public() method must return a *rsa.PublicKey or
        a *ecdsa.PublicKey or a ed25519.PublicKey. (A *rsa.PrivateKey,
        *ecdsa.PrivateKey or ed25519.PrivateKey satisfies this.)
        
        The returned slice is the certificate request in DER encoding.
    **/
    @:native("CreateCertificateRequest") static function createCertificateRequest(rand: go.io.Reader, template: go.Pointer<go.crypto.x509.CertificateRequest>, priv: Dynamic): (go.Result<go.Slice<go.Byte>>);
    /**
        CreateRevocationList creates a new X.509 v2 [Certificate] Revocation List,
        according to RFC 5280, based on template.
        
        The CRL is signed by priv which should be a crypto.Signer or
        crypto.MessageSigner associated with the public key in the issuer
        certificate.
        
        The issuer may not be nil, and the crlSign bit must be set in [KeyUsage] in
        order to use it as a CRL issuer.
        
        The issuer distinguished name CRL field and authority key identifier
        extension are populated using the issuer certificate. issuer must have
        SubjectKeyId set.
    **/
    @:native("CreateRevocationList") static function createRevocationList(rand: go.io.Reader, template: go.Pointer<go.crypto.x509.RevocationList>, issuer: go.Pointer<go.crypto.x509.Certificate>, priv: go.crypto.Signer): (go.Result<go.Slice<go.Byte>>);
    /**
        DecryptPEMBlock takes a PEM block encrypted according to RFC 1423 and the
        password used to encrypt it and returns a slice of decrypted DER encoded
        bytes. It inspects the DEK-Info header to determine the algorithm used for
        decryption. If no DEK-Info header is present, an error is returned. If an
        incorrect password is detected an [IncorrectPasswordError] is returned. Because
        of deficiencies in the format, it's not always possible to detect an
        incorrect password. In these cases no error will be returned but the
        decrypted DER bytes will be random noise.
        
        Deprecated: Legacy PEM encryption as specified in RFC 1423 is insecure by
        design. Since it does not authenticate the ciphertext, it is vulnerable to
        padding oracle attacks that can let an attacker recover the plaintext.
    **/
    @:native("DecryptPEMBlock") static function decryptPEMBlock(b: go.Pointer<go.encoding.pem.Block>, password: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    /**
        EncryptPEMBlock returns a PEM block of the specified type holding the
        given DER encoded data encrypted with the specified algorithm and
        password according to RFC 1423.
        
        Deprecated: Legacy PEM encryption as specified in RFC 1423 is insecure by
        design. Since it does not authenticate the ciphertext, it is vulnerable to
        padding oracle attacks that can let an attacker recover the plaintext.
    **/
    @:native("EncryptPEMBlock") static function encryptPEMBlock(rand: go.io.Reader, blockType: String, data: go.Slice<go.Byte>, password: go.Slice<go.Byte>, alg: go.crypto.x509.PEMCipher): (go.Result<go.Pointer<go.encoding.pem.Block>>);
    /**
        IsEncryptedPEMBlock returns whether the PEM block is password encrypted
        according to RFC 1423.
        
        Deprecated: Legacy PEM encryption as specified in RFC 1423 is insecure by
        design. Since it does not authenticate the ciphertext, it is vulnerable to
        padding oracle attacks that can let an attacker recover the plaintext.
    **/
    @:native("IsEncryptedPEMBlock") static function isEncryptedPEMBlock(b: go.Pointer<go.encoding.pem.Block>): (Bool);
    /**
        MarshalECPrivateKey converts an EC private key to SEC 1, ASN.1 DER form.
        
        This kind of key is commonly encoded in PEM blocks of type "EC PRIVATE KEY".
        For a more flexible key format which is not EC specific, use
        [MarshalPKCS8PrivateKey].
    **/
    @:native("MarshalECPrivateKey") static function marshalECPrivateKey(key: go.Pointer<go.crypto.ecdsa.PrivateKey>): (go.Result<go.Slice<go.Byte>>);
    /**
        MarshalPKCS1PrivateKey converts an [RSA] private key to PKCS #1, ASN.1 DER form.
        
        This kind of key is commonly encoded in PEM blocks of type "RSA PRIVATE KEY".
        For a more flexible key format which is not [RSA] specific, use
        [MarshalPKCS8PrivateKey].
        
        The key must have passed validation by calling [rsa.PrivateKey.Validate]
        first. MarshalPKCS1PrivateKey calls [rsa.PrivateKey.Precompute], which may
        modify the key if not already precomputed.
    **/
    @:native("MarshalPKCS1PrivateKey") static function marshalPKCS1PrivateKey(key: go.Pointer<go.crypto.rsa.PrivateKey>): (go.Slice<go.Byte>);
    /**
        MarshalPKCS1PublicKey converts an [RSA] public key to PKCS #1, ASN.1 DER form.
        
        This kind of key is commonly encoded in PEM blocks of type "RSA PUBLIC KEY".
    **/
    @:native("MarshalPKCS1PublicKey") static function marshalPKCS1PublicKey(key: go.Pointer<go.crypto.rsa.PublicKey>): (go.Slice<go.Byte>);
    /**
        MarshalPKCS8PrivateKey converts a private key to PKCS #8, ASN.1 DER form.
        
        The following key types are currently supported: *[rsa.PrivateKey],
        *[ecdsa.PrivateKey], [ed25519.PrivateKey] (not a pointer), and *[ecdh.PrivateKey].
        Unsupported key types result in an error.
        
        This kind of key is commonly encoded in PEM blocks of type "PRIVATE KEY".
        
        MarshalPKCS8PrivateKey runs [rsa.PrivateKey.Precompute] on RSA keys.
    **/
    @:native("MarshalPKCS8PrivateKey") static function marshalPKCS8PrivateKey(key: Dynamic): (go.Result<go.Slice<go.Byte>>);
    /**
        MarshalPKIXPublicKey converts a public key to PKIX, ASN.1 DER form.
        The encoded public key is a SubjectPublicKeyInfo structure
        (see RFC 5280, Section 4.1).
        
        The following key types are currently supported: *[rsa.PublicKey],
        *[ecdsa.PublicKey], [ed25519.PublicKey] (not a pointer), and *[ecdh.PublicKey].
        Unsupported key types result in an error.
        
        This kind of key is commonly encoded in PEM blocks of type "PUBLIC KEY".
    **/
    @:native("MarshalPKIXPublicKey") static function marshalPKIXPublicKey(pub: Dynamic): (go.Result<go.Slice<go.Byte>>);
    /**
        NewCertPool returns a new, empty CertPool.
    **/
    @:native("NewCertPool") static function newCertPool(): (go.Pointer<go.crypto.x509.CertPool>);
    /**
        OIDFromASN1OID creates a new OID using asn1OID.
    **/
    @:native("OIDFromASN1OID") static function oIDFromASN1OID(asn1OID: go.encoding.asn1.ObjectIdentifier): (go.Result<go.crypto.x509.OID>);
    /**
        OIDFromInts creates a new OID using ints, each integer is a separate component.
    **/
    @:native("OIDFromInts") static function oIDFromInts(oid: go.Slice<go.UInt64>): (go.Result<go.crypto.x509.OID>);
    /**
        ParseCRL parses a CRL from the given bytes. It's often the case that PEM
        encoded CRLs will appear where they should be DER encoded, so this function
        will transparently handle PEM encoding as long as there isn't any leading
        garbage.
        
        Deprecated: Use [ParseRevocationList] instead.
    **/
    @:native("ParseCRL") static function parseCRL(crlBytes: go.Slice<go.Byte>): (go.Result<go.Pointer<go.crypto.x509.pkix.CertificateList>>);
    /**
        ParseCertificate parses a single certificate from the given ASN.1 DER data.
        
        Before Go 1.23, ParseCertificate accepted certificates with negative serial
        numbers. This behavior can be restored by including "x509negativeserial=1" in
        the GODEBUG environment variable.
    **/
    @:native("ParseCertificate") static function parseCertificate(der: go.Slice<go.Byte>): (go.Result<go.Pointer<go.crypto.x509.Certificate>>);
    /**
        ParseCertificateRequest parses a single certificate request from the
        given ASN.1 DER data.
    **/
    @:native("ParseCertificateRequest") static function parseCertificateRequest(asn1Data: go.Slice<go.Byte>): (go.Result<go.Pointer<go.crypto.x509.CertificateRequest>>);
    /**
        ParseCertificates parses one or more certificates from the given ASN.1 DER
        data. The certificates must be concatenated with no intermediate padding.
    **/
    @:native("ParseCertificates") static function parseCertificates(der: go.Slice<go.Byte>): (go.Result<go.Slice<go.Pointer<go.crypto.x509.Certificate>>>);
    /**
        ParseDERCRL parses a DER encoded CRL from the given bytes.
        
        Deprecated: Use [ParseRevocationList] instead.
    **/
    @:native("ParseDERCRL") static function parseDERCRL(derBytes: go.Slice<go.Byte>): (go.Result<go.Pointer<go.crypto.x509.pkix.CertificateList>>);
    /**
        ParseECPrivateKey parses an EC private key in SEC 1, ASN.1 DER form.
        
        This kind of key is commonly encoded in PEM blocks of type "EC PRIVATE KEY".
    **/
    @:native("ParseECPrivateKey") static function parseECPrivateKey(der: go.Slice<go.Byte>): (go.Result<go.Pointer<go.crypto.ecdsa.PrivateKey>>);
    /**
        ParseOID parses a Object Identifier string, represented by ASCII numbers separated by dots.
    **/
    @:native("ParseOID") static function parseOID(oid: String): (go.Result<go.crypto.x509.OID>);
    /**
        ParsePKCS1PrivateKey parses an [RSA] private key in PKCS #1, ASN.1 DER form.
        
        This kind of key is commonly encoded in PEM blocks of type "RSA PRIVATE KEY".
        
        Before Go 1.24, the CRT parameters were ignored and recomputed. To restore
        the old behavior, use the GODEBUG=x509rsacrt=0 environment variable.
    **/
    @:native("ParsePKCS1PrivateKey") static function parsePKCS1PrivateKey(der: go.Slice<go.Byte>): (go.Result<go.Pointer<go.crypto.rsa.PrivateKey>>);
    /**
        ParsePKCS1PublicKey parses an [RSA] public key in PKCS #1, ASN.1 DER form.
        
        This kind of key is commonly encoded in PEM blocks of type "RSA PUBLIC KEY".
    **/
    @:native("ParsePKCS1PublicKey") static function parsePKCS1PublicKey(der: go.Slice<go.Byte>): (go.Result<go.Pointer<go.crypto.rsa.PublicKey>>);
    /**
        ParsePKCS8PrivateKey parses an unencrypted private key in PKCS #8, ASN.1 DER form.
        
        It returns a *[rsa.PrivateKey], an *[ecdsa.PrivateKey], an [ed25519.PrivateKey] (not
        a pointer), or an *[ecdh.PrivateKey] (for X25519). More types might be supported
        in the future.
        
        This kind of key is commonly encoded in PEM blocks of type "PRIVATE KEY".
        
        Before Go 1.24, the CRT parameters of RSA keys were ignored and recomputed.
        To restore the old behavior, use the GODEBUG=x509rsacrt=0 environment variable.
    **/
    @:native("ParsePKCS8PrivateKey") static function parsePKCS8PrivateKey(der: go.Slice<go.Byte>): (go.Result<Dynamic>);
    /**
        ParsePKIXPublicKey parses a public key in PKIX, ASN.1 DER form. The encoded
        public key is a SubjectPublicKeyInfo structure (see RFC 5280, Section 4.1).
        
        It returns a *[rsa.PublicKey], *[dsa.PublicKey], *[ecdsa.PublicKey],
        [ed25519.PublicKey] (not a pointer), or *[ecdh.PublicKey] (for X25519).
        More types might be supported in the future.
        
        This kind of key is commonly encoded in PEM blocks of type "PUBLIC KEY".
    **/
    @:native("ParsePKIXPublicKey") static function parsePKIXPublicKey(derBytes: go.Slice<go.Byte>): (go.Result<Dynamic>);
    /**
        ParseRevocationList parses a X509 v2 [Certificate] Revocation List from the given
        ASN.1 DER data.
    **/
    @:native("ParseRevocationList") static function parseRevocationList(der: go.Slice<go.Byte>): (go.Result<go.Pointer<go.crypto.x509.RevocationList>>);
    /**
        SetFallbackRoots sets the roots to use during certificate verification, if no
        custom roots are specified and a platform verifier or a system certificate
        pool is not available (for instance in a container which does not have a root
        certificate bundle). SetFallbackRoots will panic if roots is nil.
        
        SetFallbackRoots may only be called once, if called multiple times it will
        panic.
        
        The fallback behavior can be forced on all platforms, even when there is a
        system certificate pool, by setting GODEBUG=x509usefallbackroots=1 (note that
        on Windows and macOS this will disable usage of the platform verification
        APIs and cause the pure Go verifier to be used). Setting
        x509usefallbackroots=1 without calling SetFallbackRoots has no effect.
    **/
    @:native("SetFallbackRoots") static function setFallbackRoots(roots: go.Pointer<go.crypto.x509.CertPool>): Void;
    /**
        SystemCertPool returns a copy of the system cert pool.
        
        On Unix systems other than macOS the environment variables SSL_CERT_FILE and
        SSL_CERT_DIR can be used to override the system default locations for the SSL
        certificate file and SSL certificate files directory, respectively. The
        latter can be a colon-separated list.
        
        Any mutations to the returned pool are not written to disk and do not affect
        any other pool returned by SystemCertPool.
        
        New changes in the system cert pool might not be reflected in subsequent calls.
    **/
    @:native("SystemCertPool") static function systemCertPool(): (go.Result<go.Pointer<go.crypto.x509.CertPool>>);

}