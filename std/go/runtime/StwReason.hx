package go.runtime;

@:go.Type({ name: "stwReason", instanceName: "runtime.stwReason", imports: ["runtime"] })
extern typedef StwReason = haxe.extern.EitherType<go.UInt8, {
    @:native("String") function string(): (String);

}>