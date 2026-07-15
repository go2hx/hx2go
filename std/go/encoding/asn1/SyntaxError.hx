package go.encoding.asn1;

@:structInit
@:go.Type({ name: "SyntaxError", instanceName: "asn1.SyntaxError", imports: ["encoding/asn1"] })
extern class SyntaxError {

    @:native("Msg") var msg: String;

function new(msg: String);

    @:native("Error") function error(): String;

}