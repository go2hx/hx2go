package go.encoding.asn1;

/**
    A StructuralError suggests that the ASN.1 data is valid, but the Go type
    which is receiving it doesn't match.
**/
@:structInit
@:go.Type({ name: "StructuralError", instanceName: "asn1.StructuralError", imports: ["encoding/asn1"] })
extern class StructuralError {

    @:native("Msg") var msg: String;

    function new(msg: String="");

    @:native("Error") function error(): (String);

}