package go.go;

/**
    Package printer implements printing of AST nodes.
**/
@:structInit
@:go.Type({ name: "printer", instanceName: "printer.printer", imports: ["go/printer"] })
extern class Printer {

    @:native("RawFormat") static var rawFormat: go.go.printer.Mode;
    @:native("SourcePos") static var sourcePos: go.go.printer.Mode;
    @:native("TabIndent") static var tabIndent: go.go.printer.Mode;
    @:native("UseSpaces") static var useSpaces: go.go.printer.Mode;

    @:native("Config") var config: go.go.printer.Config;
    @:native("Mode") var mode: go.go.printer.Mode;
    @:native("Tabwidth") var tabwidth: go.GoInt;
    @:native("Indent") var indent: go.GoInt;

    function new(config: go.go.printer.Config);

    /**
        Fprint "pretty-prints" an AST node to output.
        It calls [Config.Fprint] with default settings.
        Note that gofmt uses tabs for indentation but spaces for alignment;
        use format.Node (package go/format) for output that matches gofmt.
    **/
    @:native("Fprint") static function fprint(output: go.io.Writer, fset: go.Pointer<go.go.token.FileSet>, node: Dynamic): (go.Error);
    @:native("Fprint") function fprint(output: go.io.Writer, fset: go.Pointer<go.go.token.FileSet>, node: Dynamic): (go.Error);

}