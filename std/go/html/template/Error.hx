package go.html.template;

@:structInit
@:go.Type({ name: "Error", instanceName: "template.Error", imports: ["html/template"] })
extern class Error {

    @:native("ErrorCode") var errorCode: go.html.template.ErrorCode;
    @:native("Node") var node: go.text.template.parse.Node;
    @:native("Name") var name: String;
    @:native("Line") var line: go.GoInt;
    @:native("Description") var description: String;

function new(errorCode: go.html.template.ErrorCode, node: go.text.template.parse.Node, name: String, line: go.GoInt, description: String);

    @:native("Error") function error(): String;

}