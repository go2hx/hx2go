package go.crypto.x509;

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

function new(raw: go.Slice<go.Byte>, rawTBSCertificate: go.Slice<go.Byte>, rawSubjectPublicKeyInfo: go.Slice<go.Byte>, rawSubject: go.Slice<go.Byte>, rawIssuer: go.Slice<go.Byte>, signature: go.Slice<go.Byte>, signatureAlgorithm: go.crypto.x509.SignatureAlgorithm, publicKeyAlgorithm: go.crypto.x509.PublicKeyAlgorithm, publicKey: Dynamic, version: go.GoInt, serialNumber: go.Pointer<go.math.big.Int>, issuer: go.crypto.x509.pkix.Name, subject: go.crypto.x509.pkix.Name, notBefore: go.time.Time, notAfter: go.time.Time, keyUsage: go.crypto.x509.KeyUsage, extensions: go.Slice<go.crypto.x509.pkix.Extension>, extraExtensions: go.Slice<go.crypto.x509.pkix.Extension>, unhandledCriticalExtensions: go.Slice<go.encoding.asn1.ObjectIdentifier>, extKeyUsage: go.Slice<go.crypto.x509.ExtKeyUsage>, unknownExtKeyUsage: go.Slice<go.encoding.asn1.ObjectIdentifier>, basicConstraintsValid: Bool, isCA: Bool, maxPathLen: go.GoInt, maxPathLenZero: Bool, subjectKeyId: go.Slice<go.Byte>, authorityKeyId: go.Slice<go.Byte>, oCSPServer: go.Slice<String>, issuingCertificateURL: go.Slice<String>, dNSNames: go.Slice<String>, emailAddresses: go.Slice<String>, iPAddresses: go.Slice<go.net.IP>, uRIs: go.Slice<go.Pointer<go.net.url.URL>>, permittedDNSDomainsCritical: Bool, permittedDNSDomains: go.Slice<String>, excludedDNSDomains: go.Slice<String>, permittedIPRanges: go.Slice<go.Pointer<go.net.IPNet>>, excludedIPRanges: go.Slice<go.Pointer<go.net.IPNet>>, permittedEmailAddresses: go.Slice<String>, excludedEmailAddresses: go.Slice<String>, permittedURIDomains: go.Slice<String>, excludedURIDomains: go.Slice<String>, cRLDistributionPoints: go.Slice<String>, policyIdentifiers: go.Slice<go.encoding.asn1.ObjectIdentifier>, policies: go.Slice<go.crypto.x509.OID>, inhibitAnyPolicy: go.GoInt, inhibitAnyPolicyZero: Bool, inhibitPolicyMapping: go.GoInt, inhibitPolicyMappingZero: Bool, requireExplicitPolicy: go.GoInt, requireExplicitPolicyZero: Bool, policyMappings: go.Slice<go.crypto.x509.PolicyMapping>);

    @:native("CheckCRLSignature") function checkCRLSignature(crl: go.Pointer<go.crypto.x509.pkix.CertificateList>): go.Error;
    @:native("CheckSignature") function checkSignature(algo: go.crypto.x509.SignatureAlgorithm, signed: go.Slice<go.Byte>, signature: go.Slice<go.Byte>): go.Error;
    @:native("CheckSignatureFrom") function checkSignatureFrom(parent: go.Pointer<go.crypto.x509.Certificate>): go.Error;
    @:native("CreateCRL") function createCRL(rand: go.io.Reader, priv: Dynamic, revokedCerts: go.Slice<go.crypto.x509.pkix.RevokedCertificate>, now: go.time.Time, expiry: go.time.Time): go.Result<go.Slice<go.Byte>>;
    @:native("Equal") function equal(other: go.Pointer<go.crypto.x509.Certificate>): Bool;
    @:native("Verify") function verify(opts: go.crypto.x509.VerifyOptions): go.Result<go.Slice<go.Slice<go.Pointer<go.crypto.x509.Certificate>>>>;
    @:native("VerifyHostname") function verifyHostname(h: String): go.Error;

}