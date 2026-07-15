package go.runtime;

@:structInit
@:go.Type({ name: "TypeAssertionError", instanceName: "runtime.TypeAssertionError", imports: ["runtime"] })
extern class TypeAssertionError {

    @:native("Error") function error(): String;
    @:native("RuntimeError") function runtimeError(): Void;

}