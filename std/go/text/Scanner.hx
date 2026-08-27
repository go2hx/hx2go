package go.text;

@:go.Type({ name: "scanner", instanceName: "scanner.scanner", imports: ["text/scanner"] })
extern class Scanner {

    @:native("Char") static var char: go.GoInt;
    @:native("Comment") static var comment: go.GoInt;
    @:native("EOF") static var EOF: go.GoInt;
    @:native("Float") static var float: go.GoInt;
    @:native("GoTokens") static var goTokens: go.GoInt;
    @:native("GoWhitespace") static var goWhitespace: go.GoInt;
    @:native("Ident") static var ident: go.GoInt;
    @:native("Int") static var int: go.GoInt;
    @:native("RawString") static var rawString: go.GoInt;
    @:native("ScanChars") static var scanChars: go.GoInt;
    @:native("ScanComments") static var scanComments: go.GoInt;
    @:native("ScanFloats") static var scanFloats: go.GoInt;
    @:native("ScanIdents") static var scanIdents: go.GoInt;
    @:native("ScanInts") static var scanInts: go.GoInt;
    @:native("ScanRawStrings") static var scanRawStrings: go.GoInt;
    @:native("ScanStrings") static var scanStrings: go.GoInt;
    @:native("SkipComments") static var skipComments: go.GoInt;
    @:native("String") static var string: go.GoInt;

    @:native("TokenString") static function tokenString(tok: go.Rune): (String);

}