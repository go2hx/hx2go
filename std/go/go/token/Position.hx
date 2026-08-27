package go.go.token;

@:structInit
@:go.Type({ name: "Position", instanceName: "token.Position", imports: ["go/token"] })
extern class Position {

    @:native("Filename") var filename: String;
    @:native("Offset") var offset: go.GoInt;
    @:native("Line") var line: go.GoInt;
    @:native("Column") var column: go.GoInt;

    function new(filename: String="", offset: go.GoInt=0, line: go.GoInt=0, column: go.GoInt=0);

    @:native("IsValid") function isValid(): (Bool);
    @:native("String") function string(): (String);

}