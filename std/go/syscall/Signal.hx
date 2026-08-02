package go.syscall;

@:go.Type({ name: "Signal", instanceName: "syscall.Signal", imports: ["syscall"] })
extern typedef Signal = haxe.extern.EitherType<go.GoInt, {
    @:native("Signal") function signal(): Void;
    @:native("String") function string(): (String);

}>