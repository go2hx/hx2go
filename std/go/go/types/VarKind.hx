package go.go.types;

/**
    A VarKind discriminates the various kinds of variables.
**/
@:go.Type({ name: "VarKind", instanceName: "types.VarKind", imports: ["go/types"] })
extern typedef VarKind = haxe.extern.EitherType<go.UInt8, {
    @:native("String") function string(): (std.String);

}>