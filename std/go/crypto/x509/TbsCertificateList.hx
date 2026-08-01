package go.crypto.x509;

@:structInit
@:go.Type({ name: "tbsCertificateList", instanceName: "x509.tbsCertificateList", imports: ["crypto/x509"] })
extern class TbsCertificateList {

    @:native("Raw") var raw: go.encoding.asn1.RawContent;
    @:native("Version") var version: go.GoInt;
    @:native("Signature") var signature: go.crypto.x509.pkix.AlgorithmIdentifier;
    @:native("Issuer") var issuer: go.encoding.asn1.RawValue;
    @:native("ThisUpdate") var thisUpdate: go.time.Time;
    @:native("NextUpdate") var nextUpdate: go.time.Time;
    @:native("RevokedCertificates") var revokedCertificates: go.Slice<go.crypto.x509.pkix.RevokedCertificate>;
    @:native("Extensions") var extensions: go.Slice<go.crypto.x509.pkix.Extension>;

    function new(raw: go.encoding.asn1.RawContent, version: go.GoInt, signature: go.crypto.x509.pkix.AlgorithmIdentifier, issuer: go.encoding.asn1.RawValue, thisUpdate: go.time.Time, nextUpdate: go.time.Time, revokedCertificates: go.Slice<go.crypto.x509.pkix.RevokedCertificate>, extensions: go.Slice<go.crypto.x509.pkix.Extension>);

}