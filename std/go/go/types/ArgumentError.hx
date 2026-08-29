package go.go.types;

/**
    An ArgumentError holds an error associated with an argument index.
**/
@:structInit
@:go.Type({ name: "ArgumentError", instanceName: "types.ArgumentError", imports: ["go/types"] })
extern class ArgumentError {

    @:native("Index") var index: go.GoInt;
    @:native("Err") var err: go.Error;

    function new(index: go.GoInt=0, err: go.Error=null);

    @:native("Error") function error(): (std.String);
    @:native("Unwrap") function unwrap(): (go.Error);

}