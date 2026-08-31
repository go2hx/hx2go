package go.encoding.asn1;

/**
    An ObjectIdentifier represents an ASN.1 OBJECT IDENTIFIER.
**/
@:go.Type({ name: "ObjectIdentifier", instanceName: "asn1.ObjectIdentifier", imports: ["encoding/asn1"] })
extern class ObjectIdentifier {

    /**
        Equal reports whether oi and other represent the same identifier.
    **/
    @:native("Equal") function equal(other: go.encoding.asn1.ObjectIdentifier): (Bool);
    @:native("String") function string(): (String);

}