package go.io.fs;

@:structInit
@:go.Type({ name: "PathError", instanceName: "fs.PathError", imports: ["io/fs"] })
extern class PathError {

    @:native("Op") var op: String;
    @:native("Path") var path: String;
    @:native("Err") var err: go.Error;

    function new(op: String, path: String, err: go.Error);

    @:native("Error") function error(): (String);
    @:native("Timeout") function timeout(): (Bool);
    @:native("Unwrap") function unwrap(): (go.Error);

}