package go.log.slog;

/**
    An Attr is a key-value pair.
**/
@:structInit
@:go.Type({ name: "Attr", instanceName: "slog.Attr", imports: ["log/slog"] })
extern class Attr {

    @:native("Key") var key: std.String;
    @:native("Value") var value: go.log.slog.Value;

    function new(key: std.String="", value: go.log.slog.Value);

    /**
        Equal reports whether a and b have equal keys and values.
    **/
    @:native("Equal") function equal(b: go.log.slog.Attr): (Bool);
    @:native("String") function string(): (std.String);

}