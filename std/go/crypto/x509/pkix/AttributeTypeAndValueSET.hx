package go.crypto.x509.pkix;

@:structInit
@:go.Type({ name: "AttributeTypeAndValueSET", instanceName: "pkix.AttributeTypeAndValueSET", imports: ["crypto/x509/pkix"] })
extern class AttributeTypeAndValueSET {

    @:native("Type") var type: go.encoding.asn1.ObjectIdentifier;
    @:native("Value") var value: go.Slice<go.Slice<go.crypto.x509.pkix.AttributeTypeAndValue>>;

function new(type: go.encoding.asn1.ObjectIdentifier, value: go.Slice<go.Slice<go.crypto.x509.pkix.AttributeTypeAndValue>>);

}