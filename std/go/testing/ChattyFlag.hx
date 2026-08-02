package go.testing;

@:structInit
@:go.Type({ name: "chattyFlag", instanceName: "testing.chattyFlag", imports: ["testing"] })
extern class ChattyFlag {

    @:native("Get") function get(): (Dynamic);
    @:native("IsBoolFlag") function isBoolFlag(): (Bool);
    @:native("Set") function set(arg: String): (go.Error);
    @:native("String") function string(): (String);

}