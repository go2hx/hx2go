package go.encoding.asn1;

@:structInit
@:go.Type({ name: "StructuralError", instanceName: "asn1.StructuralError", imports: ["encoding/asn1"] })
extern class StructuralError {

    @:native("Msg") var msg: String;

function new(msg: String);

    @:native("Error") function error(): String;

}