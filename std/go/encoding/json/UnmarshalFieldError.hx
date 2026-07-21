package go.encoding.json;

@:structInit
@:go.Type({ name: "UnmarshalFieldError", instanceName: "json.UnmarshalFieldError", imports: ["encoding/json"] })
extern class UnmarshalFieldError {

    @:native("Key") var key: String;
    @:native("Type") var type: go.reflect.Type;
    @:native("Field") var field: go.reflect.StructField;

    function new(key: String, type: go.reflect.Type, field: go.reflect.StructField);

    @:native("Error") function error(): (String);

}