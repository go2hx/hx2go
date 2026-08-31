package go.runtime;

/**
    A PanicNilError happens when code calls panic(nil).
    
    Before Go 1.21, programs that called panic(nil) observed recover returning nil.
    Starting in Go 1.21, programs that call panic(nil) observe recover returning a *PanicNilError.
    Programs can change back to the old behavior by setting GODEBUG=panicnil=1.
**/
@:structInit
@:go.Type({ name: "PanicNilError", instanceName: "runtime.PanicNilError", imports: ["runtime"] })
extern class PanicNilError {

    @:native("Error") function error(): (String);
    @:native("RuntimeError") function runtimeError(): Void;

}