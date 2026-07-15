package go.go;

@:go.Type({ name: "printer", instanceName: "printer.printer", imports: ["go/printer"] })
extern class Printer {

    @:native("RawFormat") static var RawFormat: go.go.printer.Mode;
    @:native("SourcePos") static var SourcePos: go.go.printer.Mode;
    @:native("TabIndent") static var TabIndent: go.go.printer.Mode;
    @:native("UseSpaces") static var UseSpaces: go.go.printer.Mode;

    @:native("Fprint") static function fprint(output: go.io.Writer, fset: go.Pointer<go.go.token.FileSet>, node: Dynamic): go.Error;

}