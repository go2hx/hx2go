package go.crypto.x509.pkix;

/**
    AttributeTypeAndValue mirrors the ASN.1 structure of the same name in
    RFC 5280, Section 4.1.2.4.
**/
@:structInit
@:go.Type({ name: "AttributeTypeAndValue", instanceName: "pkix.AttributeTypeAndValue", imports: ["crypto/x509/pkix"] })
extern class AttributeTypeAndValue {

    @:native("Type") var type: go.encoding.asn1.ObjectIdentifier;
    @:native("Value") var value: Dynamic;

    function new(type: go.encoding.asn1.ObjectIdentifier=null, value: Dynamic=null);

}