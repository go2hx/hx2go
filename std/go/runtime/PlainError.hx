package go.runtime;

@:go.Type({ name: "plainError", instanceName: "runtime.plainError", imports: ["runtime"] })
extern typedef PlainError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);
    @:native("RuntimeError") function runtimeError(): Void;

}>