package go.crypto.x509;

@:structInit
@:go.Type({ name: "publicKeyInfo", instanceName: "x509.publicKeyInfo", imports: ["crypto/x509"] })
extern class PublicKeyInfo {

    @:native("Raw") var raw: go.encoding.asn1.RawContent;
    @:native("Algorithm") var algorithm: go.crypto.x509.pkix.AlgorithmIdentifier;
    @:native("PublicKey") var publicKey: go.encoding.asn1.BitString;

    function new(raw: go.encoding.asn1.RawContent=null, algorithm: go.crypto.x509.pkix.AlgorithmIdentifier, publicKey: go.encoding.asn1.BitString);

}