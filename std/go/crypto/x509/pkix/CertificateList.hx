package go.crypto.x509.pkix;

/**
    CertificateList represents the ASN.1 structure of the same name. See RFC
    5280, section 5.1. Use Certificate.CheckCRLSignature to verify the
    signature.
    
    Deprecated: x509.RevocationList should be used instead.
**/
@:structInit
@:go.Type({ name: "CertificateList", instanceName: "pkix.CertificateList", imports: ["crypto/x509/pkix"] })
extern class CertificateList {

    @:native("TBSCertList") var tBSCertList: go.crypto.x509.pkix.TBSCertificateList;
    @:native("SignatureAlgorithm") var signatureAlgorithm: go.crypto.x509.pkix.AlgorithmIdentifier;
    @:native("SignatureValue") var signatureValue: go.encoding.asn1.BitString;

    function new(tBSCertList: go.crypto.x509.pkix.TBSCertificateList, signatureAlgorithm: go.crypto.x509.pkix.AlgorithmIdentifier, signatureValue: go.encoding.asn1.BitString);

    /**
        HasExpired reports whether certList should have been updated by now.
    **/
    @:native("HasExpired") function hasExpired(now: go.time.Time): (Bool);

}