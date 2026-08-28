package go.flag;

@:go.Type({ name: "int64Value", instanceName: "flag.int64Value", imports: ["flag"] })
extern typedef Int64Value = haxe.extern.EitherType<go.Int64, {
    @:native("Get") function get(): (Dynamic);
    @:native("Set") function set(s: std.String): (go.Error);
    @:native("String") function string(): (std.String);

}>