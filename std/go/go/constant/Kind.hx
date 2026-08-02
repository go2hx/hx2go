package go.go.constant;

@:go.Type({ name: "Kind", instanceName: "constant.Kind", imports: ["go/constant"] })
extern typedef Kind = haxe.extern.EitherType<go.GoInt, {
    @:native("String") function string(): (String);

}>