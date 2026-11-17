package go.go.scanner;

/**
    A Scanner holds the scanner's internal state while processing
    a given text. It can be allocated as part of another data
    structure but must be initialized via [Scanner.Init] before use.
**/
@:structInit
@:go.Type({ name: "Scanner", instanceName: "scanner.Scanner", imports: ["go/scanner"] })
extern class Scanner {

    @:native("ErrorCount") var errorCount: go.GoInt;

    function new(errorCount: go.GoInt=0);

    /**
        Init prepares the scanner s to tokenize the text src by setting the
        scanner at the beginning of src. The scanner uses the file set file
        for position information and it adds line information for each line.
        It is ok to re-use the same file when re-scanning the same file as
        line information which is already present is ignored. Init causes a
        panic if the file size does not match the src size.
        
        Calls to [Scanner.Scan] will invoke the error handler err if they encounter a
        syntax error and err is not nil. Also, for each error encountered,
        the [Scanner] field ErrorCount is incremented by one. The mode parameter
        determines how comments are handled.
        
        Note that Init may call err if there is an error in the first character
        of the file.
    **/
    @:native("Init") function init(file: go.Pointer<go.go.token.File>, src: go.Slice<go.Byte>, err: go.go.scanner.ErrorHandler, mode: go.go.scanner.Mode): Void;
    /**
        Scan scans the next token and returns the token position, the token,
        and its literal string if applicable. The source end is indicated by
        [token.EOF].
        
        If the returned token is a literal ([token.IDENT], [token.INT], [token.FLOAT],
        [token.IMAG], [token.CHAR], [token.STRING]) or [token.COMMENT], the literal string
        has the corresponding value.
        
        If the returned token is a keyword, the literal string is the keyword.
        
        If the returned token is [token.SEMICOLON], the corresponding
        literal string is ";" if the semicolon was present in the source,
        and "\n" if the semicolon was inserted because of a newline or
        at EOF.
        
        If the returned token is [token.ILLEGAL], the literal string is the
        offending character.
        
        In all other cases, Scan returns an empty literal string.
        
        For more tolerant parsing, Scan will return a valid token if
        possible even if a syntax error was encountered. Thus, even
        if the resulting token sequence contains no illegal tokens,
        a client may not assume that no error occurred. Instead it
        must check the scanner's ErrorCount or the number of calls
        of the error handler, if there was one installed.
        
        Scan adds line information to the file added to the file
        set with Init. Token positions are relative to that file
        and thus relative to the file set.
    **/
    @:go.Tuple("pos", "tok", "lit") @:native("Scan") function scan(): (go.Tuple<{ pos: go.go.token.Pos, tok: go.go.token.Token, lit: String }>);

}