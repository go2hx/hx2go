package go.testing;

@:structInit
@:go.Type({ name: "chattyPrinter", instanceName: "testing.chattyPrinter", imports: ["testing"] })
extern class ChattyPrinter {

    @:native("Printf") function printf(testName: String, format: String, args: haxe.Rest<Dynamic>): Void;
    @:native("Updatef") function updatef(testName: String, format: String, args: haxe.Rest<Dynamic>): Void;

}