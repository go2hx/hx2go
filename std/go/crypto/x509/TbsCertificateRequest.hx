package go.crypto.x509;

@:structInit
@:go.Type({ name: "tbsCertificateRequest", instanceName: "x509.tbsCertificateRequest", imports: ["crypto/x509"] })
extern class TbsCertificateRequest {

    @:native("Raw") var raw: go.encoding.asn1.RawContent;
    @:native("Version") var version: go.GoInt;
    @:native("Subject") var subject: go.encoding.asn1.RawValue;
    @:native("PublicKey") var publicKey: go.crypto.x509.PublicKeyInfo;
    @:native("RawAttributes") var rawAttributes: go.Slice<go.encoding.asn1.RawValue>;

    function new(raw: go.encoding.asn1.RawContent=null, version: go.GoInt=0, subject: go.encoding.asn1.RawValue, publicKey: go.crypto.x509.PublicKeyInfo, rawAttributes: go.Slice<go.encoding.asn1.RawValue>=null);

}