package go.runtime;

@:go.Type({ name: "lockRank", instanceName: "runtime.lockRank", imports: ["runtime"] })
extern typedef LockRank = haxe.extern.EitherType<go.GoInt, {
    @:native("String") function string(): (String);

}>