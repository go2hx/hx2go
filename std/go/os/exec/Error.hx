package go.os.exec;

/**
    Error is returned by [LookPath] when it fails to classify a file as an
    executable.
**/
@:structInit
@:go.Type({ name: "Error", instanceName: "exec.Error", imports: ["os/exec"] })
extern class Error {

    @:native("Name") var name: String;
    @:native("Err") var err: go.Error;

    function new(name: String="", err: go.Error=null);

    @:native("Error") function error(): (String);
    @:native("Unwrap") function unwrap(): (go.Error);

}