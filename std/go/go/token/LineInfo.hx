package go.go.token;

@:structInit
@:go.Type({ name: "lineInfo", instanceName: "token.lineInfo", imports: ["go/token"] })
extern class LineInfo {

    @:native("Offset") var offset: go.GoInt;
    @:native("Filename") var filename: String;
    @:native("Line") var line: go.GoInt;
    @:native("Column") var column: go.GoInt;

    function new(offset: go.GoInt, filename: String, line: go.GoInt, column: go.GoInt);

}