package go.crypto.x509.pkix;

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

function new(raw: go.encoding.asn1.RawContent, version: go.GoInt, signature: go.crypto.x509.pkix.AlgorithmIdentifier, issuer: go.crypto.x509.pkix.RDNSequence, thisUpdate: go.time.Time, nextUpdate: go.time.Time, revokedCertificates: go.Slice<go.crypto.x509.pkix.RevokedCertificate>, extensions: go.Slice<go.crypto.x509.pkix.Extension>);

}