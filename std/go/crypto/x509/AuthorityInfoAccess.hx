package go.crypto.x509;

@:structInit
@:go.Type({ name: "authorityInfoAccess", instanceName: "x509.authorityInfoAccess", imports: ["crypto/x509"] })
extern class AuthorityInfoAccess {

    @:native("Method") var method: go.encoding.asn1.ObjectIdentifier;
    @:native("Location") var location: go.encoding.asn1.RawValue;

    function new(method: go.encoding.asn1.ObjectIdentifier, location: go.encoding.asn1.RawValue);

}