package go.os.exec;

@:structInit
@:go.Type({ name: "wrappedError", instanceName: "exec.wrappedError", imports: ["os/exec"] })
extern class WrappedError {

    @:native("Error") function error(): (String);
    @:native("Unwrap") function unwrap(): (go.Error);

}