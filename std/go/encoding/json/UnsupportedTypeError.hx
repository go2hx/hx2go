package go.encoding.json;

/**
    An UnsupportedTypeError is returned by [Marshal] when attempting
    to encode an unsupported value type.
**/
@:structInit
@:go.Type({ name: "UnsupportedTypeError", instanceName: "json.UnsupportedTypeError", imports: ["encoding/json"] })
extern class UnsupportedTypeError {

    @:native("Type") var type: go.reflect.Type;

    function new(type: go.reflect.Type=null);

    @:native("Error") function error(): (String);

}