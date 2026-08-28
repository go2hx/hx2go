package go.time;

/**
    ParseError describes a problem parsing a time string.
**/
@:structInit
@:go.Type({ name: "ParseError", instanceName: "time.ParseError", imports: ["time"] })
extern class ParseError {

    @:native("Layout") var layout: String;
    @:native("Value") var value: String;
    @:native("LayoutElem") var layoutElem: String;
    @:native("ValueElem") var valueElem: String;
    @:native("Message") var message: String;

    function new(layout: String="", value: String="", layoutElem: String="", valueElem: String="", message: String="");

    /**
        Error returns the string representation of a ParseError.
    **/
    @:native("Error") function error(): (String);

}