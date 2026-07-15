package go.net;

@:structInit
@:go.Type({ name: "ParseError", instanceName: "net.ParseError", imports: ["net"] })
extern class ParseError {

    @:native("Type") var type: String;
    @:native("Text") var text: String;

function new(type: String, text: String);

    @:native("Error") function error(): String;
    @:native("Temporary") function temporary(): Bool;
    @:native("Timeout") function timeout(): Bool;

}