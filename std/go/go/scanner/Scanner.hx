package go.go.scanner;

@:structInit
@:go.Type({ name: "Scanner", instanceName: "scanner.Scanner", imports: ["go/scanner"] })
extern class Scanner {

    @:native("ErrorCount") var errorCount: go.GoInt;

    function new(errorCount: go.GoInt);

    @:native("Init") function init(file: go.Pointer<go.go.token.File>, src: go.Slice<go.Byte>, err: go.go.scanner.ErrorHandler, mode: go.go.scanner.Mode): Void;
    @:go.Tuple("pos", "tok", "lit") @:native("Scan") function scan(): (go.Tuple<{ pos: go.go.token.Pos, tok: go.go.token.Token, lit: String }>);

}