package go.encoding.xml;

/**
    A SyntaxError represents a syntax error in the XML input stream.
**/
@:structInit
@:go.Type({ name: "SyntaxError", instanceName: "xml.SyntaxError", imports: ["encoding/xml"] })
extern class SyntaxError {

    @:native("Msg") var msg: String;
    @:native("Line") var line: go.GoInt;

    function new(msg: String="", line: go.GoInt=0);

    @:native("Error") function error(): (String);

}