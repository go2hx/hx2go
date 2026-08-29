package go.crypto.x509.pkix;

/**
    TBSCertificateList represents the ASN.1 structure of the same name. See RFC
    5280, section 5.1.
    
    Deprecated: x509.RevocationList should be used instead.
**/
@:structInit
@:go.Type({ name: "TBSCertificateList", instanceName: "pkix.TBSCertificateList", imports: ["crypto/x509/pkix"] })
extern class TBSCertificateList {

    @:native("Raw") var raw: go.encoding.asn1.RawContent;
    @:native("Version") var version: go.GoInt;
    @:native("Signature") var signature: go.crypto.x509.pkix.AlgorithmIdentifier;
    @:native("Issuer") var issuer: go.crypto.x509.pkix.RDNSequence;
    @:native("ThisUpdate") var thisUpdate: go.time.Time;
    @:native("NextUpdate") var nextUpdate: go.time.Time;
    @:native("RevokedCertificates") var revokedCertificates: go.Slice<go.crypto.x509.pkix.RevokedCertificate>;
    @:native("Extensions") var extensions: go.Slice<go.crypto.x509.pkix.Extension>;

    function new(raw: go.encoding.asn1.RawContent=null, version: go.GoInt=0, signature: go.crypto.x509.pkix.AlgorithmIdentifier, issuer: go.crypto.x509.pkix.RDNSequence=null, thisUpdate: go.time.Time, nextUpdate: go.time.Time, revokedCertificates: go.Slice<go.crypto.x509.pkix.RevokedCertificate>=null, extensions: go.Slice<go.crypto.x509.pkix.Extension>=null);

}