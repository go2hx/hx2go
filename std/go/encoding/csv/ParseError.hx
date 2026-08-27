package go.encoding.csv;

@:structInit
@:go.Type({ name: "ParseError", instanceName: "csv.ParseError", imports: ["encoding/csv"] })
extern class ParseError {

    @:native("StartLine") var startLine: go.GoInt;
    @:native("Line") var line: go.GoInt;
    @:native("Column") var column: go.GoInt;
    @:native("Err") var err: go.Error;

    function new(startLine: go.GoInt=0, line: go.GoInt=0, column: go.GoInt=0, err: go.Error=null);

    @:native("Error") function error(): (String);
    @:native("Unwrap") function unwrap(): (go.Error);

}