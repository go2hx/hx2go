package go.flag;

@:structInit
@:go.Type({ name: "textValue", instanceName: "flag.textValue", imports: ["flag"] })
extern class TextValue {

    @:native("Get") function get(): (Dynamic);
    @:native("Set") function set(s: String): (go.Error);
    @:native("String") function string(): (String);

}