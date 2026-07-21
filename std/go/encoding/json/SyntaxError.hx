package go.encoding.json;

@:structInit
@:go.Type({ name: "SyntaxError", instanceName: "json.SyntaxError", imports: ["encoding/json"] })
extern class SyntaxError {

    @:native("Offset") var offset: go.Int64;

    function new(offset: go.Int64);

    @:native("Error") function error(): (String);

}