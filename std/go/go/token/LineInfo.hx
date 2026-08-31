package go.go.token;

@:structInit
@:go.Type({ name: "lineInfo", instanceName: "token.lineInfo", imports: ["go/token"] })
extern class LineInfo {

    @:native("Offset") var offset: go.GoInt;
    @:native("Filename") var filename: std.String;
    @:native("Line") var line: go.GoInt;
    @:native("Column") var column: go.GoInt;

    function new(offset: go.GoInt=0, filename: std.String="", line: go.GoInt=0, column: go.GoInt=0);

}