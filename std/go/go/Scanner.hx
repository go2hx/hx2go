package go.go;

/**
    Package scanner implements a scanner for Go source text.
    It takes a []byte as source which can then be tokenized
    through repeated calls to the Scan method.
**/
@:go.Type({ name: "scanner", instanceName: "scanner.scanner", imports: ["go/scanner"] })
extern class Scanner {

    @:native("ScanComments") static var scanComments: go.go.scanner.Mode;

    /**
        PrintError is a utility function that prints a list of errors to w,
        one error per line, if the err parameter is an [ErrorList]. Otherwise
        it prints the err string.
    **/
    @:native("PrintError") static function printError(w: go.io.Writer, err: go.Error): Void;

}