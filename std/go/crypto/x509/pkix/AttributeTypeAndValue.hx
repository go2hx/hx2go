package go.crypto.x509.pkix;

@:structInit
@:go.Type({ name: "AttributeTypeAndValue", instanceName: "pkix.AttributeTypeAndValue", imports: ["crypto/x509/pkix"] })
extern class AttributeTypeAndValue {

    @:native("Type") var type: go.encoding.asn1.ObjectIdentifier;
    @:native("Value") var value: Dynamic;

function new(type: go.encoding.asn1.ObjectIdentifier, value: Dynamic);

}