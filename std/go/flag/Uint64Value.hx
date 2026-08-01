package go.flag;

@:go.Type({ name: "uint64Value", instanceName: "flag.uint64Value", imports: ["flag"] })
extern typedef Uint64Value = haxe.extern.EitherType<go.UInt64, {
    @:native("Get") function get(): (Dynamic);
    @:native("Set") function set(s: String): (go.Error);
    @:native("String") function string(): (String);

}>