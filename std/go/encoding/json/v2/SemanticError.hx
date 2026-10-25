package go.encoding.json.v2;

/**
    SemanticError describes an error determining the meaning
    of JSON data as Go data, or vice versa.
    
    If a [Marshaler], [MarshalerTo], [Unmarshaler], or [UnmarshalerFrom] method
    returns a SemanticError when called by the [json] package,
    then the ByteOffset, JSONPointer, and GoType fields are automatically
    populated by the calling context if they are the zero value.
    
    The contents of this error as produced by this package may change over time.
**/
@:structInit
@:go.Type({ name: "SemanticError", instanceName: "json.SemanticError", imports: ["encoding/json/v2"] })
extern class SemanticError {

    @:native("ByteOffset") var byteOffset: go.Int64;
    @:native("JSONPointer") var jSONPointer: go.encoding.json.jsontext.Pointer;
    @:native("JSONKind") var jSONKind: go.encoding.json.jsontext.Kind;
    @:native("JSONValue") var jSONValue: go.encoding.json.jsontext.Value;
    @:native("GoType") var goType: go.reflect.Type;
    @:native("Err") var err: go.Error;

    function new(byteOffset: go.Int64=0, jSONPointer: go.encoding.json.jsontext.Pointer=cast "", jSONKind: go.encoding.json.jsontext.Kind=cast 0, jSONValue: go.encoding.json.jsontext.Value=null, goType: go.reflect.Type=null, err: go.Error=null);

    @:native("Error") function error(): (String);
    @:native("Unwrap") function unwrap(): (go.Error);

}