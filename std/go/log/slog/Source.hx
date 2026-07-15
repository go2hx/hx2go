package go.log.slog;

@:structInit
@:go.Type({ name: "Source", instanceName: "slog.Source", imports: ["log/slog"] })
extern class Source {

    @:native("Function") var _function: String;
    @:native("File") var file: String;
    @:native("Line") var line: go.GoInt;

function new(_function: String, file: String, line: go.GoInt);

}