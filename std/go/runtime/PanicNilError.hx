package go.runtime;

@:structInit
@:go.Type({ name: "PanicNilError", instanceName: "runtime.PanicNilError", imports: ["runtime"] })
extern class PanicNilError {

    @:native("Error") function error(): String;
    @:native("RuntimeError") function runtimeError(): Void;

}