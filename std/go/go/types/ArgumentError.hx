package go.go.types;

@:structInit
@:go.Type({ name: "ArgumentError", instanceName: "types.ArgumentError", imports: ["go/types"] })
extern class ArgumentError {

    @:native("Index") var index: go.GoInt;
    @:native("Err") var err: go.Error;

    function new(index: go.GoInt, err: go.Error);

    @:native("Error") function error(): (String);
    @:native("Unwrap") function unwrap(): (go.Error);

}