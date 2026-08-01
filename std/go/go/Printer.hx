package go.go;

@:structInit
@:go.Type({ name: "printer", instanceName: "printer.printer", imports: ["go/printer"] })
extern class Printer {

    @:native("RawFormat") static var RawFormat: go.go.printer.Mode;
    @:native("SourcePos") static var SourcePos: go.go.printer.Mode;
    @:native("TabIndent") static var TabIndent: go.go.printer.Mode;
    @:native("UseSpaces") static var UseSpaces: go.go.printer.Mode;

    @:native("Config") var config: go.go.printer.Config;
    @:native("Mode") var mode: go.go.printer.Mode;
    @:native("Tabwidth") var tabwidth: go.GoInt;
    @:native("Indent") var indent: go.GoInt;

    function new(config: go.go.printer.Config);

    @:native("Fprint") static function fprint(output: go.io.Writer, fset: go.Pointer<go.go.token.FileSet>, node: Dynamic): (go.Error);
    @:native("Fprint") function fprint(output: go.io.Writer, fset: go.Pointer<go.go.token.FileSet>, node: Dynamic): (go.Error);

}