package go.text.scanner;

/**
    Position is a value that represents a source position.
    A position is valid if Line > 0.
**/
@:structInit
@:go.Type({ name: "Position", instanceName: "scanner.Position", imports: ["text/scanner"] })
extern class Position {

    @:native("Filename") var filename: std.String;
    @:native("Offset") var offset: go.GoInt;
    @:native("Line") var line: go.GoInt;
    @:native("Column") var column: go.GoInt;

    function new(filename: std.String="", offset: go.GoInt=0, line: go.GoInt=0, column: go.GoInt=0);

    /**
        IsValid reports whether the position is valid.
    **/
    @:native("IsValid") function isValid(): (Bool);
    @:native("String") function string(): (std.String);

}