package go.os.exec;

@:structInit
@:go.Type({ name: "Error", instanceName: "exec.Error", imports: ["os/exec"] })
extern class Error {

    @:native("Name") var name: String;
    @:native("Err") var err: go.Error;

    function new(name: String, err: go.Error);

    @:native("Error") function error(): (String);
    @:native("Unwrap") function unwrap(): (go.Error);

}