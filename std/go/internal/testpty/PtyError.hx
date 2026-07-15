package go.internal.testpty;

@:structInit
@:go.Type({ name: "PtyError", instanceName: "testpty.PtyError", imports: ["internal/testpty"] })
extern class PtyError {

    @:native("FuncName") var funcName: String;
    @:native("ErrorString") var errorString: String;
    @:native("Errno") var errno: go.Error;

function new(funcName: String, errorString: String, errno: go.Error);

    @:native("Error") function error(): String;
    @:native("Unwrap") function unwrap(): go.Error;

}