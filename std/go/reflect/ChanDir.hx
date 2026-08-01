package go.reflect;

@:go.Type({ name: "ChanDir", instanceName: "reflect.ChanDir", imports: ["reflect"] })
extern typedef ChanDir = haxe.extern.EitherType<go.GoInt, {
    @:native("String") function string(): (String);

}>