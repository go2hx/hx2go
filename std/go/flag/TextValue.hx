package go.flag;

@:structInit
@:go.Type({ name: "textValue", instanceName: "flag.textValue", imports: ["flag"] })
extern class TextValue {

    @:native("Get") function get(): (Dynamic);
    @:native("Set") function set(s: std.String): (go.Error);
    @:native("String") function string(): (std.String);

}