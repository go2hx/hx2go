package go.reflect;

/**
    A Kind represents the specific kind of type that a [Type] represents.
    The zero Kind is not a valid kind.
**/
@:go.Type({ name: "Kind", instanceName: "reflect.Kind", imports: ["reflect"] })
extern typedef Kind = haxe.extern.EitherType<go.GoUInt, {
    /**
        String returns the name of k.
    **/
    @:native("String") function string(): (std.String);

}>