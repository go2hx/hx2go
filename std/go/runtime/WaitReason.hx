package go.runtime;

@:go.Type({ name: "waitReason", instanceName: "runtime.waitReason", imports: ["runtime"] })
extern typedef WaitReason = haxe.extern.EitherType<go.UInt8, {
    @:native("String") function string(): (String);

}>