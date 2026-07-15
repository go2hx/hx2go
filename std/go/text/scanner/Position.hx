package go.text.scanner;

@:structInit
@:go.Type({ name: "Position", instanceName: "scanner.Position", imports: ["text/scanner"] })
extern class Position {

    @:native("Filename") var filename: String;
    @:native("Offset") var offset: go.GoInt;
    @:native("Line") var line: go.GoInt;
    @:native("Column") var column: go.GoInt;

function new(filename: String, offset: go.GoInt, line: go.GoInt, column: go.GoInt);

    @:native("IsValid") function isValid(): Bool;
    @:native("String") function string(): String;

}