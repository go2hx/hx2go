package go.go.printer;

@:structInit
@:go.Type({ name: "Config", instanceName: "printer.Config", imports: ["go/printer"] })
extern class Config {

    @:native("Mode") var mode: go.go.printer.Mode;
    @:native("Tabwidth") var tabwidth: go.GoInt;
    @:native("Indent") var indent: go.GoInt;

function new(mode: go.go.printer.Mode, tabwidth: go.GoInt, indent: go.GoInt);

    @:native("Fprint") function fprint(output: go.io.Writer, fset: go.Pointer<go.go.token.FileSet>, node: Dynamic): go.Error;

}