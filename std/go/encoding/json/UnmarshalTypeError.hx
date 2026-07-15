package go.encoding.json;

@:structInit
@:go.Type({ name: "UnmarshalTypeError", instanceName: "json.UnmarshalTypeError", imports: ["encoding/json"] })
extern class UnmarshalTypeError {

    @:native("Value") var value: String;
    @:native("Type") var type: go.reflect.Type;
    @:native("Offset") var offset: go.Int64;
    @:native("Struct") var struct: String;
    @:native("Field") var field: String;

function new(value: String, type: go.reflect.Type, offset: go.Int64, struct: String, field: String);

    @:native("Error") function error(): String;

}