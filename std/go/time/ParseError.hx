package go.time;

@:structInit
@:go.Type({ name: "ParseError", instanceName: "time.ParseError", imports: ["time"] })
extern class ParseError {

    @:native("Layout") var layout: String;
    @:native("Value") var value: String;
    @:native("LayoutElem") var layoutElem: String;
    @:native("ValueElem") var valueElem: String;
    @:native("Message") var message: String;

function new(layout: String, value: String, layoutElem: String, valueElem: String, message: String);

    @:native("Error") function error(): String;

}