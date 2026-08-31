package go.flag;

@:go.Type({ name: "intValue", instanceName: "flag.intValue", imports: ["flag"] })
extern typedef IntValue = haxe.extern.EitherType<go.GoInt, {
    @:native("Get") function get(): (Dynamic);
    @:native("Set") function set(s: std.String): (go.Error);
    @:native("String") function string(): (std.String);

}>