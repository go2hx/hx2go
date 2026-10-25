package go.runtime;

@:go.Type({ name: "lockRank", instanceName: "runtime.lockRank", imports: ["runtime"] })
extern typedef LockRank = haxe.extern.EitherType<go.Int64, {
    @:native("String") function string(): (String);

}>