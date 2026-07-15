package go.encoding.xml;

@:structInit
@:go.Type({ name: "SyntaxError", instanceName: "xml.SyntaxError", imports: ["encoding/xml"] })
extern class SyntaxError {

    @:native("Msg") var msg: String;
    @:native("Line") var line: go.GoInt;

function new(msg: String, line: go.GoInt);

    @:native("Error") function error(): String;

}