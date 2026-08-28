package go.crypto.x509.pkix;

/**
    AttributeTypeAndValueSET represents a set of ASN.1 sequences of
    [AttributeTypeAndValue] sequences from RFC 2986 (PKCS #10).
**/
@:structInit
@:go.Type({ name: "AttributeTypeAndValueSET", instanceName: "pkix.AttributeTypeAndValueSET", imports: ["crypto/x509/pkix"] })
extern class AttributeTypeAndValueSET {

    @:native("Type") var type: go.encoding.asn1.ObjectIdentifier;
    @:native("Value") var value: go.Slice<go.Slice<go.crypto.x509.pkix.AttributeTypeAndValue>>;

    function new(type: go.encoding.asn1.ObjectIdentifier=null, value: go.Slice<go.Slice<go.crypto.x509.pkix.AttributeTypeAndValue>>=null);

}