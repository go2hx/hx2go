package go.debug.gosym;

@:structInit
@:go.Type({ name: "UnknownLineError", instanceName: "gosym.UnknownLineError", imports: ["debug/gosym"] })
extern class UnknownLineError {

    @:native("File") var file: String;
    @:native("Line") var line: go.GoInt;

function new(file: String, line: go.GoInt);

    @:native("Error") function error(): String;

}