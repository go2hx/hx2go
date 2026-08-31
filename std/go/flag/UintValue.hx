package go.flag;

@:go.Type({ name: "uintValue", instanceName: "flag.uintValue", imports: ["flag"] })
extern typedef UintValue = haxe.extern.EitherType<go.GoUInt, {
    @:native("Get") function get(): (Dynamic);
    @:native("Set") function set(s: std.String): (go.Error);
    @:native("String") function string(): (std.String);

}>