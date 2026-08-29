package go.io.fs;

/**
    PathError records an error and the operation and file path that caused it.
**/
@:structInit
@:go.Type({ name: "PathError", instanceName: "fs.PathError", imports: ["io/fs"] })
extern class PathError {

    @:native("Op") var op: String;
    @:native("Path") var path: String;
    @:native("Err") var err: go.Error;

    function new(op: String="", path: String="", err: go.Error=null);

    @:native("Error") function error(): (String);
    /**
        Timeout reports whether this error represents a timeout.
    **/
    @:native("Timeout") function timeout(): (Bool);
    @:native("Unwrap") function unwrap(): (go.Error);

}