package go.runtime;

/**
    A TypeAssertionError explains a failed type assertion.
**/
@:structInit
@:go.Type({ name: "TypeAssertionError", instanceName: "runtime.TypeAssertionError", imports: ["runtime"] })
extern class TypeAssertionError {

    @:native("Error") function error(): (String);
    @:native("RuntimeError") function runtimeError(): Void;

}