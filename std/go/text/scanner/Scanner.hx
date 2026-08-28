package go.text.scanner;

/**
    A Scanner implements reading of Unicode characters and tokens from an [io.Reader].
**/
@:structInit
@:go.Type({ name: "Scanner", instanceName: "scanner.Scanner", imports: ["text/scanner"] })
extern class Scanner {

    @:native("Error") var error: (s: go.Pointer<go.text.scanner.Scanner>, msg: std.String) -> Void;
    @:native("ErrorCount") var errorCount: go.GoInt;
    @:native("Mode") var mode: go.GoUInt;
    @:native("Whitespace") var whitespace: go.UInt64;
    @:native("IsIdentRune") var isIdentRune: (ch: go.Rune, i: go.GoInt) -> (Bool);
    @:native("Position") var position: go.text.scanner.Position;
    @:native("Filename") var filename: std.String;
    @:native("Offset") var offset: go.GoInt;
    @:native("Line") var line: go.GoInt;
    @:native("Column") var column: go.GoInt;

    function new(error: (s: go.Pointer<go.text.scanner.Scanner>, msg: std.String) -> Void=null, errorCount: go.GoInt=0, mode: go.GoUInt=0, whitespace: go.UInt64=0, isIdentRune: (ch: go.Rune, i: go.GoInt) -> (Bool)=null, position: go.text.scanner.Position);

    /**
        Init initializes a [Scanner] with a new source and returns s.
        [Scanner.Error] is set to nil, [Scanner.ErrorCount] is set to 0, [Scanner.Mode] is set to [GoTokens],
        and [Scanner.Whitespace] is set to [GoWhitespace].
    **/
    @:native("Init") function init(src: go.io.Reader): (go.Pointer<go.text.scanner.Scanner>);
    @:native("IsValid") function isValid(): (Bool);
    /**
        Next reads and returns the next Unicode character.
        It returns [EOF] at the end of the source. It reports
        a read error by calling s.Error, if not nil; otherwise
        it prints an error message to [os.Stderr]. Next does not
        update the [Scanner.Position] field; use [Scanner.Pos]() to
        get the current position.
    **/
    @:native("Next") function next(): (go.Rune);
    /**
        Peek returns the next Unicode character in the source without advancing
        the scanner. It returns [EOF] if the scanner's position is at the last
        character of the source.
    **/
    @:native("Peek") function peek(): (go.Rune);
    /**
        Pos returns the position of the character immediately after
        the character or token returned by the last call to [Scanner.Next] or [Scanner.Scan].
        Use the [Scanner.Position] field for the start position of the most
        recently scanned token.
    **/
    @:native("Pos") function pos(): (go.text.scanner.Position);
    /**
        Scan reads the next token or Unicode character from source and returns it.
        It only recognizes tokens t for which the respective [Scanner.Mode] bit (1<<-t) is set.
        It returns [EOF] at the end of the source. It reports scanner errors (read and
        token errors) by calling s.Error, if not nil; otherwise it prints an error
        message to [os.Stderr].
    **/
    @:native("Scan") function scan(): (go.Rune);
    @:native("String") function string(): (std.String);
    /**
        TokenText returns the string corresponding to the most recently scanned token.
        Valid after calling [Scanner.Scan] and in calls of [Scanner.Error].
    **/
    @:native("TokenText") function tokenText(): (std.String);

}