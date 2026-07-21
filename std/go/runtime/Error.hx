package go.runtime;

@:go.Type({ name: "Error", instanceName: "runtime.Error", imports: ["runtime"] })
extern typedef Error = {

    @:native("Error") function error(): (String);
    @:native("RuntimeError") function runtimeError(): Void;

}