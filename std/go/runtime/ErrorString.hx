package go.runtime;

@:go.Type({ name: "errorString", instanceName: "runtime.errorString", imports: ["runtime"] })
extern typedef ErrorString = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);
    @:native("RuntimeError") function runtimeError(): Void;

}>