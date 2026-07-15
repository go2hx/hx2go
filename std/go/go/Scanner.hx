package go.go;

@:go.Type({ name: "scanner", instanceName: "scanner.scanner", imports: ["go/scanner"] })
extern class Scanner {

    @:native("ScanComments") static var ScanComments: go.go.scanner.Mode;

    @:native("PrintError") static function printError(w: go.io.Writer, err: go.Error): Void;

}