package go.encoding.json.jsontext;

/**
    SyntacticError is a description of an error that occurred when
    encoding or decoding JSON according to the grammar.
    
    The contents of this error as produced by this package may change over time.
**/
@:structInit
@:go.Type({ name: "SyntacticError", instanceName: "jsontext.SyntacticError", imports: ["encoding/json/jsontext"] })
extern class SyntacticError {

    @:native("ByteOffset") var byteOffset: go.Int64;
    @:native("JSONPointer") var jSONPointer: go.encoding.json.jsontext.Pointer;
    @:native("Err") var err: go.Error;

    function new(byteOffset: go.Int64=0, jSONPointer: go.encoding.json.jsontext.Pointer=cast "", err: go.Error=null);

    @:native("Error") function error(): (std.String);
    @:native("Unwrap") function unwrap(): (go.Error);

}