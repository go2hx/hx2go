package go.encoding.json;

/**
    A SyntaxError is a description of a JSON syntax error.
    [Unmarshal] will return a SyntaxError if the JSON can't be parsed.
**/
@:structInit
@:go.Type({ name: "SyntaxError", instanceName: "json.SyntaxError", imports: ["encoding/json"] })
extern class SyntaxError {

    @:native("Offset") var offset: go.Int64;

    function new(offset: go.Int64=0);

    @:native("Error") function error(): (String);

}