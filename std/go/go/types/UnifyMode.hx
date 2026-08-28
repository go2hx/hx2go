package go.go.types;

@:go.Type({ name: "unifyMode", instanceName: "types.unifyMode", imports: ["go/types"] })
extern typedef UnifyMode = haxe.extern.EitherType<go.GoUInt, {
    @:native("String") function string(): (std.String);

}>