package go.flag;

@:go.Type({ name: "float64Value", instanceName: "flag.float64Value", imports: ["flag"] })
extern typedef Float64Value = haxe.extern.EitherType<Float, {
    @:native("Get") function get(): (Dynamic);
    @:native("Set") function set(s: String): (go.Error);
    @:native("String") function string(): (String);

}>