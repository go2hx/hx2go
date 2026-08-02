package go.flag;

@:go.Type({ name: "stringValue", instanceName: "flag.stringValue", imports: ["flag"] })
extern typedef StringValue = haxe.extern.EitherType<String, {
    @:native("Get") function get(): (Dynamic);
    @:native("Set") function set(val: String): (go.Error);
    @:native("String") function string(): (String);

}>