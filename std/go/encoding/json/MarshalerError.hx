package go.encoding.json;

@:structInit
@:go.Type({ name: "MarshalerError", instanceName: "json.MarshalerError", imports: ["encoding/json"] })
extern class MarshalerError {

    @:native("Type") var type: go.reflect.Type;
    @:native("Err") var err: go.Error;

function new(type: go.reflect.Type, err: go.Error);

    @:native("Error") function error(): String;
    @:native("Unwrap") function unwrap(): go.Error;

}