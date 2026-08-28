package go.encoding.json;

/**
    A MarshalerError represents an error from calling a
    [Marshaler.MarshalJSON] or [encoding.TextMarshaler.MarshalText] method.
**/
@:structInit
@:go.Type({ name: "MarshalerError", instanceName: "json.MarshalerError", imports: ["encoding/json"] })
extern class MarshalerError {

    @:native("Type") var type: go.reflect.Type;
    @:native("Err") var err: go.Error;

    function new(type: go.reflect.Type=null, err: go.Error=null);

    @:native("Error") function error(): (String);
    /**
        Unwrap returns the underlying error.
    **/
    @:native("Unwrap") function unwrap(): (go.Error);

}