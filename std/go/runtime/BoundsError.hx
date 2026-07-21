package go.runtime;

@:structInit
@:go.Type({ name: "boundsError", instanceName: "runtime.boundsError", imports: ["runtime"] })
extern class BoundsError {

    @:native("Error") function error(): (String);
    @:native("RuntimeError") function runtimeError(): Void;

}