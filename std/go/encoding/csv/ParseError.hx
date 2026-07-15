package go.encoding.csv;

@:structInit
@:go.Type({ name: "ParseError", instanceName: "csv.ParseError", imports: ["encoding/csv"] })
extern class ParseError {

    @:native("StartLine") var startLine: go.GoInt;
    @:native("Line") var line: go.GoInt;
    @:native("Column") var column: go.GoInt;
    @:native("Err") var err: go.Error;

function new(startLine: go.GoInt, line: go.GoInt, column: go.GoInt, err: go.Error);

    @:native("Error") function error(): String;
    @:native("Unwrap") function unwrap(): go.Error;

}