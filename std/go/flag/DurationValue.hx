package go.flag;

@:go.Type({ name: "durationValue", instanceName: "flag.durationValue", imports: ["flag"] })
extern typedef DurationValue = haxe.extern.EitherType<go.Int64, {
    @:native("Get") function get(): (Dynamic);
    @:native("Set") function set(s: String): (go.Error);
    @:native("String") function string(): (String);

}>