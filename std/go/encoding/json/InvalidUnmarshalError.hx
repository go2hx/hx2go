package go.encoding.json;

@:structInit
@:go.Type({ name: "InvalidUnmarshalError", instanceName: "json.InvalidUnmarshalError", imports: ["encoding/json"] })
extern class InvalidUnmarshalError {

    @:native("Type") var type: go.reflect.Type;

    function new(type: go.reflect.Type);

    @:native("Error") function error(): (String);

}