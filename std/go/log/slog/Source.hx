package go.log.slog;

/**
    Source describes the location of a line of source code.
**/
@:structInit
@:go.Type({ name: "Source", instanceName: "slog.Source", imports: ["log/slog"] })
extern class Source {

    @:native("Function") var _function: std.String;
    @:native("File") var file: std.String;
    @:native("Line") var line: go.GoInt;

    function new(_function: std.String="", file: std.String="", line: go.GoInt=0);

}