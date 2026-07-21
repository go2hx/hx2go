package go.encoding.json;

@:structInit
@:go.Type({ name: "UnsupportedTypeError", instanceName: "json.UnsupportedTypeError", imports: ["encoding/json"] })
extern class UnsupportedTypeError {

    @:native("Type") var type: go.reflect.Type;

    function new(type: go.reflect.Type);

    @:native("Error") function error(): (String);

}