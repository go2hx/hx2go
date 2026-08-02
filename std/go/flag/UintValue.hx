package go.flag;

@:go.Type({ name: "uintValue", instanceName: "flag.uintValue", imports: ["flag"] })
extern typedef UintValue = haxe.extern.EitherType<go.GoUInt, {
    @:native("Get") function get(): (Dynamic);
    @:native("Set") function set(s: String): (go.Error);
    @:native("String") function string(): (String);

}>