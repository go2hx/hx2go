package go.text.scanner;

@:structInit
@:go.Type({ name: "Scanner", instanceName: "scanner.Scanner", imports: ["text/scanner"] })
extern class Scanner {

    @:native("Error") var error: (s: go.Pointer<go.text.scanner.Scanner>, msg: String) -> Void;
    @:native("ErrorCount") var errorCount: go.GoInt;
    @:native("Mode") var mode: go.GoUInt;
    @:native("Whitespace") var whitespace: go.UInt64;
    @:native("IsIdentRune") var isIdentRune: (ch: go.Rune, i: go.GoInt) -> Bool;
    @:native("Position") var position: go.text.scanner.Position;

function new(error: (s: go.Pointer<go.text.scanner.Scanner>, msg: String) -> Void, errorCount: go.GoInt, mode: go.GoUInt, whitespace: go.UInt64, isIdentRune: (ch: go.Rune, i: go.GoInt) -> Bool, position: go.text.scanner.Position);

    @:native("Init") function init(src: go.io.Reader): go.Pointer<go.text.scanner.Scanner>;
    @:native("IsValid") function isValid(): Bool;
    @:native("Next") function next(): go.Rune;
    @:native("Peek") function peek(): go.Rune;
    @:native("Pos") function pos(): go.text.scanner.Position;
    @:native("Scan") function scan(): go.Rune;
    @:native("String") function string(): String;
    @:native("TokenText") function tokenText(): String;

}