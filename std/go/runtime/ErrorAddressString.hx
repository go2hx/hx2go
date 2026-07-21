package go.runtime;

@:structInit
@:go.Type({ name: "errorAddressString", instanceName: "runtime.errorAddressString", imports: ["runtime"] })
extern class ErrorAddressString {

    @:native("Addr") function addr(): (go.UIntPtr);
    @:native("Error") function error(): (String);
    @:native("RuntimeError") function runtimeError(): Void;

}