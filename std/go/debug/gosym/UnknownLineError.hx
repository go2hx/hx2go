package go.debug.gosym;

/**
    UnknownLineError represents a failure to map a line to a program
    counter, either because the line is beyond the bounds of the file
    or because there is no code on the given line.
**/
@:structInit
@:go.Type({ name: "UnknownLineError", instanceName: "gosym.UnknownLineError", imports: ["debug/gosym"] })
extern class UnknownLineError {

    @:native("File") var file: String;
    @:native("Line") var line: go.GoInt;

    function new(file: String="", line: go.GoInt=0);

    @:native("Error") function error(): (String);

}