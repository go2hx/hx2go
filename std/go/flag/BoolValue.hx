package go.flag;

@:go.Type({ name: "boolValue", instanceName: "flag.boolValue", imports: ["flag"] })
extern typedef BoolValue = haxe.extern.EitherType<Bool, {
    @:native("Get") function get(): (Dynamic);
    @:native("IsBoolFlag") function isBoolFlag(): (Bool);
    @:native("Set") function set(s: String): (go.Error);
    @:native("String") function string(): (String);

}>