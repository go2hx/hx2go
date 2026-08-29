package go.html.template;

/**
    Error describes a problem encountered during template Escaping.
**/
@:structInit
@:go.Type({ name: "Error", instanceName: "template.Error", imports: ["html/template"] })
extern class Error {

    @:native("ErrorCode") var errorCode: go.html.template.ErrorCode;
    @:native("Node") var node: go.text.template.parse.Node;
    @:native("Name") var name: String;
    @:native("Line") var line: go.GoInt;
    @:native("Description") var description: String;

    function new(errorCode: go.html.template.ErrorCode=cast 0, node: go.text.template.parse.Node=null, name: String="", line: go.GoInt=0, description: String="");

    @:native("Error") function error(): (String);

}