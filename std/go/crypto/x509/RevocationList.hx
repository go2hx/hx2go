package go.crypto.x509;

@:structInit
@:go.Type({ name: "RevocationList", instanceName: "x509.RevocationList", imports: ["crypto/x509"] })
extern class RevocationList {

    @:native("Raw") var raw: go.Slice<go.Byte>;
    @:native("RawTBSRevocationList") var rawTBSRevocationList: go.Slice<go.Byte>;
    @:native("RawIssuer") var rawIssuer: go.Slice<go.Byte>;
    @:native("Issuer") var issuer: go.crypto.x509.pkix.Name;
    @:native("AuthorityKeyId") var authorityKeyId: go.Slice<go.Byte>;
    @:native("Signature") var signature: go.Slice<go.Byte>;
    @:native("SignatureAlgorithm") var signatureAlgorithm: go.crypto.x509.SignatureAlgorithm;
    @:native("RevokedCertificateEntries") var revokedCertificateEntries: go.Slice<go.crypto.x509.RevocationListEntry>;
    @:native("RevokedCertificates") var revokedCertificates: go.Slice<go.crypto.x509.pkix.RevokedCertificate>;
    @:native("Number") var number: go.Pointer<go.math.big.Int>;
    @:native("ThisUpdate") var thisUpdate: go.time.Time;
    @:native("NextUpdate") var nextUpdate: go.time.Time;
    @:native("Extensions") var extensions: go.Slice<go.crypto.x509.pkix.Extension>;
    @:native("ExtraExtensions") var extraExtensions: go.Slice<go.crypto.x509.pkix.Extension>;

function new(raw: go.Slice<go.Byte>, rawTBSRevocationList: go.Slice<go.Byte>, rawIssuer: go.Slice<go.Byte>, issuer: go.crypto.x509.pkix.Name, authorityKeyId: go.Slice<go.Byte>, signature: go.Slice<go.Byte>, signatureAlgorithm: go.crypto.x509.SignatureAlgorithm, revokedCertificateEntries: go.Slice<go.crypto.x509.RevocationListEntry>, revokedCertificates: go.Slice<go.crypto.x509.pkix.RevokedCertificate>, number: go.Pointer<go.math.big.Int>, thisUpdate: go.time.Time, nextUpdate: go.time.Time, extensions: go.Slice<go.crypto.x509.pkix.Extension>, extraExtensions: go.Slice<go.crypto.x509.pkix.Extension>);

    @:native("CheckSignatureFrom") function checkSignatureFrom(parent: go.Pointer<go.crypto.x509.Certificate>): go.Error;

}