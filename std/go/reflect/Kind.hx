package go.reflect;

@:go.Type({ name: "Kind", instanceName: "reflect.Kind", imports: ["reflect"] })
extern typedef Kind = haxe.extern.EitherType<go.GoUInt, {
    @:native("String") function string(): (String);

}>