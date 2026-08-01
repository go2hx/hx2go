package go.go.types;

@:go.Type({ name: "VarKind", instanceName: "types.VarKind", imports: ["go/types"] })
extern typedef VarKind = haxe.extern.EitherType<go.UInt8, {
    @:native("String") function string(): (String);

}>