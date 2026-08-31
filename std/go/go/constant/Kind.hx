package go.go.constant;

/**
    Kind specifies the kind of value represented by a [Value].
**/
@:go.Type({ name: "Kind", instanceName: "constant.Kind", imports: ["go/constant"] })
extern typedef Kind = haxe.extern.EitherType<go.GoInt, {
    @:native("String") function string(): (std.String);

}>