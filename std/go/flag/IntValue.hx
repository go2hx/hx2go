package go.flag;

@:go.Type({ name: "intValue", instanceName: "flag.intValue", imports: ["flag"] })
extern typedef IntValue = haxe.extern.EitherType<go.GoInt, {
    @:native("Get") function get(): (Dynamic);
    @:native("Set") function set(s: String): (go.Error);
    @:native("String") function string(): (String);

}>