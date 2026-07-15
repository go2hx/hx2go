package go.encoding.asn1;

@:go.Type({ name: "ObjectIdentifier", instanceName: "asn1.ObjectIdentifier", imports: ["encoding/asn1"] })
extern class ObjectIdentifier {

    @:native("Equal") function equal(other: go.encoding.asn1.ObjectIdentifier): Bool;
    @:native("String") function string(): String;

}