package go.log.slog;

@:structInit
@:go.Type({ name: "Attr", instanceName: "slog.Attr", imports: ["log/slog"] })
extern class Attr {

    @:native("Key") var key: String;
    @:native("Value") var value: go.log.slog.Value;

function new(key: String, value: go.log.slog.Value);

    @:native("Equal") function equal(b: go.log.slog.Attr): Bool;
    @:native("String") function string(): String;

}