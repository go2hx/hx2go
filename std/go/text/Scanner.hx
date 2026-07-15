package go.text;

@:go.Type({ name: "scanner", instanceName: "scanner.scanner", imports: ["text/scanner"] })
extern class Scanner {

    @:native("Char") static var Char: go.GoInt;
    @:native("Comment") static var Comment: go.GoInt;
    @:native("EOF") static var EOF: go.GoInt;
    @:native("Float") static var Float: go.GoInt;
    @:native("GoTokens") static var GoTokens: go.GoInt;
    @:native("GoWhitespace") static var GoWhitespace: go.GoInt;
    @:native("Ident") static var Ident: go.GoInt;
    @:native("Int") static var Int: go.GoInt;
    @:native("RawString") static var RawString: go.GoInt;
    @:native("ScanChars") static var ScanChars: go.GoInt;
    @:native("ScanComments") static var ScanComments: go.GoInt;
    @:native("ScanFloats") static var ScanFloats: go.GoInt;
    @:native("ScanIdents") static var ScanIdents: go.GoInt;
    @:native("ScanInts") static var ScanInts: go.GoInt;
    @:native("ScanRawStrings") static var ScanRawStrings: go.GoInt;
    @:native("ScanStrings") static var ScanStrings: go.GoInt;
    @:native("SkipComments") static var SkipComments: go.GoInt;
    @:native("String") static var String: go.GoInt;

    @:native("TokenString") static function tokenString(tok: go.Rune): String;

}