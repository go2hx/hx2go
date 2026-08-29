package go.crypto.x509;

/**
    A Certificate represents an X.509 certificate.
**/
@:structInit
@:go.Type({ name: "Certificate", instanceName: "x509.Certificate", imports: ["crypto/x509"] })
extern class Certificate {

    @:native("Raw") var raw: go.Slice<go.Byte>;
    @:native("RawTBSCertificate") var rawTBSCertificate: go.Slice<go.Byte>;
    @:native("RawSubjectPublicKeyInfo") var rawSubjectPublicKeyInfo: go.Slice<go.Byte>;
    @:native("RawSubject") var rawSubject: go.Slice<go.Byte>;
    @:native("RawIssuer") var rawIssuer: go.Slice<go.Byte>;
    @:native("Signature") var signature: go.Slice<go.Byte>;
    @:native("SignatureAlgorithm") var signatureAlgorithm: go.crypto.x509.SignatureAlgorithm;
    @:native("PublicKeyAlgorithm") var publicKeyAlgorithm: go.crypto.x509.PublicKeyAlgorithm;
    @:native("PublicKey") var publicKey: Dynamic;
    @:native("Version") var version: go.GoInt;
    @:native("SerialNumber") var serialNumber: go.Pointer<go.math.big.Int>;
    @:native("Issuer") var issuer: go.crypto.x509.pkix.Name;
    @:native("Subject") var subject: go.crypto.x509.pkix.Name;
    @:native("NotBefore") var notBefore: go.time.Time;
    @:native("NotAfter") var notAfter: go.time.Time;
    @:native("KeyUsage") var keyUsage: go.crypto.x509.KeyUsage;
    @:native("Extensions") var extensions: go.Slice<go.crypto.x509.pkix.Extension>;
    @:native("ExtraExtensions") var extraExtensions: go.Slice<go.crypto.x509.pkix.Extension>;
    @:native("UnhandledCriticalExtensions") var unhandledCriticalExtensions: go.Slice<go.encoding.asn1.ObjectIdentifier>;
    @:native("ExtKeyUsage") var extKeyUsage: go.Slice<go.crypto.x509.ExtKeyUsage>;
    @:native("UnknownExtKeyUsage") var unknownExtKeyUsage: go.Slice<go.encoding.asn1.ObjectIdentifier>;
    @:native("BasicConstraintsValid") var basicConstraintsValid: Bool;
    @:native("IsCA") var isCA: Bool;
    @:native("MaxPathLen") var maxPathLen: go.GoInt;
    @:native("MaxPathLenZero") var maxPathLenZero: Bool;
    @:native("SubjectKeyId") var subjectKeyId: go.Slice<go.Byte>;
    @:native("AuthorityKeyId") var authorityKeyId: go.Slice<go.Byte>;
    @:native("OCSPServer") var oCSPServer: go.Slice<String>;
    @:native("IssuingCertificateURL") var issuingCertificateURL: go.Slice<String>;
    @:native("DNSNames") var dNSNames: go.Slice<String>;
    @:native("EmailAddresses") var emailAddresses: go.Slice<String>;
    @:native("IPAddresses") var iPAddresses: go.Slice<go.net.IP>;
    @:native("URIs") var uRIs: go.Slice<go.Pointer<go.net.url.URL>>;
    @:native("PermittedDNSDomainsCritical") var permittedDNSDomainsCritical: Bool;
    @:native("PermittedDNSDomains") var permittedDNSDomains: go.Slice<String>;
    @:native("ExcludedDNSDomains") var excludedDNSDomains: go.Slice<String>;
    @:native("PermittedIPRanges") var permittedIPRanges: go.Slice<go.Pointer<go.net.IPNet>>;
    @:native("ExcludedIPRanges") var excludedIPRanges: go.Slice<go.Pointer<go.net.IPNet>>;
    @:native("PermittedEmailAddresses") var permittedEmailAddresses: go.Slice<String>;
    @:native("ExcludedEmailAddresses") var excludedEmailAddresses: go.Slice<String>;
    @:native("PermittedURIDomains") var permittedURIDomains: go.Slice<String>;
    @:native("ExcludedURIDomains") var excludedURIDomains: go.Slice<String>;
    @:native("CRLDistributionPoints") var cRLDistributionPoints: go.Slice<String>;
    @:native("PolicyIdentifiers") var policyIdentifiers: go.Slice<go.encoding.asn1.ObjectIdentifier>;
    @:native("Policies") var policies: go.Slice<go.crypto.x509.OID>;
    @:native("InhibitAnyPolicy") var inhibitAnyPolicy: go.GoInt;
    @:native("InhibitAnyPolicyZero") var inhibitAnyPolicyZero: Bool;
    @:native("InhibitPolicyMapping") var inhibitPolicyMapping: go.GoInt;
    @:native("InhibitPolicyMappingZero") var inhibitPolicyMappingZero: Bool;
    @:native("RequireExplicitPolicy") var requireExplicitPolicy: go.GoInt;
    @:native("RequireExplicitPolicyZero") var requireExplicitPolicyZero: Bool;
    @:native("PolicyMappings") var policyMappings: go.Slice<go.crypto.x509.PolicyMapping>;

    function new(raw: go.Slice<go.Byte>=null, rawTBSCertificate: go.Slice<go.Byte>=null, rawSubjectPublicKeyInfo: go.Slice<go.Byte>=null, rawSubject: go.Slice<go.Byte>=null, rawIssuer: go.Slice<go.Byte>=null, signature: go.Slice<go.Byte>=null, signatureAlgorithm: go.crypto.x509.SignatureAlgorithm=cast 0, publicKeyAlgorithm: go.crypto.x509.PublicKeyAlgorithm=cast 0, publicKey: Dynamic=null, version: go.GoInt=0, serialNumber: go.Pointer<go.math.big.Int>=null, issuer: go.crypto.x509.pkix.Name, subject: go.crypto.x509.pkix.Name, notBefore: go.time.Time, notAfter: go.time.Time, keyUsage: go.crypto.x509.KeyUsage=cast 0, extensions: go.Slice<go.crypto.x509.pkix.Extension>=null, extraExtensions: go.Slice<go.crypto.x509.pkix.Extension>=null, unhandledCriticalExtensions: go.Slice<go.encoding.asn1.ObjectIdentifier>=null, extKeyUsage: go.Slice<go.crypto.x509.ExtKeyUsage>=null, unknownExtKeyUsage: go.Slice<go.encoding.asn1.ObjectIdentifier>=null, basicConstraintsValid: Bool=false, isCA: Bool=false, maxPathLen: go.GoInt=0, maxPathLenZero: Bool=false, subjectKeyId: go.Slice<go.Byte>=null, authorityKeyId: go.Slice<go.Byte>=null, oCSPServer: go.Slice<String>=null, issuingCertificateURL: go.Slice<String>=null, dNSNames: go.Slice<String>=null, emailAddresses: go.Slice<String>=null, iPAddresses: go.Slice<go.net.IP>=null, uRIs: go.Slice<go.Pointer<go.net.url.URL>>=null, permittedDNSDomainsCritical: Bool=false, permittedDNSDomains: go.Slice<String>=null, excludedDNSDomains: go.Slice<String>=null, permittedIPRanges: go.Slice<go.Pointer<go.net.IPNet>>=null, excludedIPRanges: go.Slice<go.Pointer<go.net.IPNet>>=null, permittedEmailAddresses: go.Slice<String>=null, excludedEmailAddresses: go.Slice<String>=null, permittedURIDomains: go.Slice<String>=null, excludedURIDomains: go.Slice<String>=null, cRLDistributionPoints: go.Slice<String>=null, policyIdentifiers: go.Slice<go.encoding.asn1.ObjectIdentifier>=null, policies: go.Slice<go.crypto.x509.OID>=null, inhibitAnyPolicy: go.GoInt=0, inhibitAnyPolicyZero: Bool=false, inhibitPolicyMapping: go.GoInt=0, inhibitPolicyMappingZero: Bool=false, requireExplicitPolicy: go.GoInt=0, requireExplicitPolicyZero: Bool=false, policyMappings: go.Slice<go.crypto.x509.PolicyMapping>=null);

    /**
        CheckCRLSignature checks that the signature in crl is from c.
        
        Deprecated: Use [RevocationList.CheckSignatureFrom] instead.
    **/
    @:native("CheckCRLSignature") function checkCRLSignature(crl: go.Pointer<go.crypto.x509.pkix.CertificateList>): (go.Error);
    /**
        CheckSignature verifies that signature is a valid signature over signed from
        c's public key.
        
        This is a low-level API that performs no validity checks on the certificate.
        
        [MD5WithRSA] signatures are rejected, while [SHA1WithRSA] and [ECDSAWithSHA1]
        signatures are currently accepted.
    **/
    @:native("CheckSignature") function checkSignature(algo: go.crypto.x509.SignatureAlgorithm, signed: go.Slice<go.Byte>, signature: go.Slice<go.Byte>): (go.Error);
    /**
        CheckSignatureFrom verifies that the signature on c is a valid signature from parent.
        
        This is a low-level API that performs very limited checks, and not a full
        path verifier. Most users should use [Certificate.Verify] instead.
    **/
    @:native("CheckSignatureFrom") function checkSignatureFrom(parent: go.Pointer<go.crypto.x509.Certificate>): (go.Error);
    /**
        CreateCRL returns a DER encoded CRL, signed by this Certificate, that
        contains the given list of revoked certificates.
        
        Deprecated: this method does not generate an RFC 5280 conformant X.509 v2 CRL.
        To generate a standards compliant CRL, use [CreateRevocationList] instead.
    **/
    @:native("CreateCRL") function createCRL(rand: go.io.Reader, priv: Dynamic, revokedCerts: go.Slice<go.crypto.x509.pkix.RevokedCertificate>, now: go.time.Time, expiry: go.time.Time): (go.Result<go.Slice<go.Byte>>);
    @:native("Equal") function equal(other: go.Pointer<go.crypto.x509.Certificate>): (Bool);
    /**
        Verify attempts to verify c by building one or more chains from c to a
        certificate in opts.Roots, using certificates in opts.Intermediates if
        needed. If successful, it returns one or more chains where the first
        element of the chain is c and the last element is from opts.Roots.
        
        If opts.Roots is nil, the platform verifier might be used, and
        verification details might differ from what is described below. If system
        roots are unavailable the returned error will be of type SystemRootsError.
        
        Name constraints in the intermediates will be applied to all names claimed
        in the chain, not just opts.DNSName. Thus it is invalid for a leaf to claim
        example.com if an intermediate doesn't permit it, even if example.com is not
        the name being validated. Note that DirectoryName constraints are not
        supported.
        
        Name constraint validation follows the rules from RFC 5280, with the
        addition that DNS name constraints may use the leading period format
        defined for emails and URIs. When a constraint has a leading period
        it indicates that at least one additional label must be prepended to
        the constrained name to be considered valid.
        
        Extended Key Usage values are enforced nested down a chain, so an intermediate
        or root that enumerates EKUs prevents a leaf from asserting an EKU not in that
        list. (While this is not specified, it is common practice in order to limit
        the types of certificates a CA can issue.)
        
        Certificates that use SHA1WithRSA and ECDSAWithSHA1 signatures are not supported,
        and will not be used to build chains.
        
        Certificates other than c in the returned chains should not be modified.
        
        WARNING: this function doesn't do any revocation checking.
    **/
    @:native("Verify") function verify(opts: go.crypto.x509.VerifyOptions): (go.Result<go.Slice<go.Slice<go.Pointer<go.crypto.x509.Certificate>>>>);
    /**
        VerifyHostname returns nil if c is a valid certificate for the named host.
        Otherwise it returns an error describing the mismatch.
        
        IP addresses can be optionally enclosed in square brackets and are checked
        against the IPAddresses field. Other names are checked case insensitively
        against the DNSNames field. If the names are valid hostnames, the certificate
        fields can have a wildcard as the complete left-most label (e.g. *.example.com).
        
        Note that the legacy Common Name field is ignored.
    **/
    @:native("VerifyHostname") function verifyHostname(h: String): (go.Error);

}