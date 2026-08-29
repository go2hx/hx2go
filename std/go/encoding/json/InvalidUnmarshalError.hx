package go.encoding.json;

/**
    An InvalidUnmarshalError describes an invalid argument passed to [Unmarshal].
    (The argument to [Unmarshal] must be a non-nil pointer.)
**/
@:structInit
@:go.Type({ name: "InvalidUnmarshalError", instanceName: "json.InvalidUnmarshalError", imports: ["encoding/json"] })
extern class InvalidUnmarshalError {

    @:native("Type") var type: go.reflect.Type;

    function new(type: go.reflect.Type=null);

    @:native("Error") function error(): (String);

}