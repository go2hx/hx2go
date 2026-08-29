package go.text;

/**
    Package scanner provides a scanner and tokenizer for UTF-8-encoded text.
    It takes an io.Reader providing the source, which then can be tokenized
    through repeated calls to the Scan function. For compatibility with
    existing tools, the NUL character is not allowed. If the first character
    in the source is a UTF-8 encoded byte order mark (BOM), it is discarded.
    
    By default, a [Scanner] skips white space and Go comments and recognizes all
    literals as defined by the Go language specification. It may be
    customized to recognize only a subset of those literals and to recognize
    different identifier and white space characters.
**/
@:go.Type({ name: "scanner", instanceName: "scanner.scanner", imports: ["text/scanner"] })
extern class Scanner {

    /**
        The result of Scan is one of these tokens or a Unicode character.
    **/
    @:native("Char") static var char: go.GoInt;
    /**
        The result of Scan is one of these tokens or a Unicode character.
    **/
    @:native("Comment") static var comment: go.GoInt;
    /**
        The result of Scan is one of these tokens or a Unicode character.
    **/
    @:native("EOF") static var EOF: go.GoInt;
    /**
        The result of Scan is one of these tokens or a Unicode character.
    **/
    @:native("Float") static var float: go.GoInt;
    /**
        Predefined mode bits to control recognition of tokens. For instance,
        to configure a [Scanner] such that it only recognizes (Go) identifiers,
        integers, and skips comments, set the Scanner's Mode field to:
        
        	ScanIdents | ScanInts | ScanComments | SkipComments
        
        With the exceptions of comments, which are skipped if SkipComments is
        set, unrecognized tokens are not ignored. Instead, the scanner simply
        returns the respective individual characters (or possibly sub-tokens).
        For instance, if the mode is ScanIdents (not ScanStrings), the string
        "foo" is scanned as the token sequence '"' [Ident] '"'.
        
        Use GoTokens to configure the Scanner such that it accepts all Go
        literal tokens including Go identifiers. Comments will be skipped.
    **/
    @:native("GoTokens") static var goTokens: go.GoInt;
    /**
        GoWhitespace is the default value for the [Scanner]'s Whitespace field.
        Its value selects Go's white space characters.
    **/
    @:native("GoWhitespace") static var goWhitespace: go.GoInt;
    /**
        The result of Scan is one of these tokens or a Unicode character.
    **/
    @:native("Ident") static var ident: go.GoInt;
    /**
        The result of Scan is one of these tokens or a Unicode character.
    **/
    @:native("Int") static var int: go.GoInt;
    /**
        The result of Scan is one of these tokens or a Unicode character.
    **/
    @:native("RawString") static var rawString: go.GoInt;
    /**
        Predefined mode bits to control recognition of tokens. For instance,
        to configure a [Scanner] such that it only recognizes (Go) identifiers,
        integers, and skips comments, set the Scanner's Mode field to:
        
        	ScanIdents | ScanInts | ScanComments | SkipComments
        
        With the exceptions of comments, which are skipped if SkipComments is
        set, unrecognized tokens are not ignored. Instead, the scanner simply
        returns the respective individual characters (or possibly sub-tokens).
        For instance, if the mode is ScanIdents (not ScanStrings), the string
        "foo" is scanned as the token sequence '"' [Ident] '"'.
        
        Use GoTokens to configure the Scanner such that it accepts all Go
        literal tokens including Go identifiers. Comments will be skipped.
    **/
    @:native("ScanChars") static var scanChars: go.GoInt;
    /**
        Predefined mode bits to control recognition of tokens. For instance,
        to configure a [Scanner] such that it only recognizes (Go) identifiers,
        integers, and skips comments, set the Scanner's Mode field to:
        
        	ScanIdents | ScanInts | ScanComments | SkipComments
        
        With the exceptions of comments, which are skipped if SkipComments is
        set, unrecognized tokens are not ignored. Instead, the scanner simply
        returns the respective individual characters (or possibly sub-tokens).
        For instance, if the mode is ScanIdents (not ScanStrings), the string
        "foo" is scanned as the token sequence '"' [Ident] '"'.
        
        Use GoTokens to configure the Scanner such that it accepts all Go
        literal tokens including Go identifiers. Comments will be skipped.
    **/
    @:native("ScanComments") static var scanComments: go.GoInt;
    /**
        Predefined mode bits to control recognition of tokens. For instance,
        to configure a [Scanner] such that it only recognizes (Go) identifiers,
        integers, and skips comments, set the Scanner's Mode field to:
        
        	ScanIdents | ScanInts | ScanComments | SkipComments
        
        With the exceptions of comments, which are skipped if SkipComments is
        set, unrecognized tokens are not ignored. Instead, the scanner simply
        returns the respective individual characters (or possibly sub-tokens).
        For instance, if the mode is ScanIdents (not ScanStrings), the string
        "foo" is scanned as the token sequence '"' [Ident] '"'.
        
        Use GoTokens to configure the Scanner such that it accepts all Go
        literal tokens including Go identifiers. Comments will be skipped.
    **/
    @:native("ScanFloats") static var scanFloats: go.GoInt;
    /**
        Predefined mode bits to control recognition of tokens. For instance,
        to configure a [Scanner] such that it only recognizes (Go) identifiers,
        integers, and skips comments, set the Scanner's Mode field to:
        
        	ScanIdents | ScanInts | ScanComments | SkipComments
        
        With the exceptions of comments, which are skipped if SkipComments is
        set, unrecognized tokens are not ignored. Instead, the scanner simply
        returns the respective individual characters (or possibly sub-tokens).
        For instance, if the mode is ScanIdents (not ScanStrings), the string
        "foo" is scanned as the token sequence '"' [Ident] '"'.
        
        Use GoTokens to configure the Scanner such that it accepts all Go
        literal tokens including Go identifiers. Comments will be skipped.
    **/
    @:native("ScanIdents") static var scanIdents: go.GoInt;
    /**
        Predefined mode bits to control recognition of tokens. For instance,
        to configure a [Scanner] such that it only recognizes (Go) identifiers,
        integers, and skips comments, set the Scanner's Mode field to:
        
        	ScanIdents | ScanInts | ScanComments | SkipComments
        
        With the exceptions of comments, which are skipped if SkipComments is
        set, unrecognized tokens are not ignored. Instead, the scanner simply
        returns the respective individual characters (or possibly sub-tokens).
        For instance, if the mode is ScanIdents (not ScanStrings), the string
        "foo" is scanned as the token sequence '"' [Ident] '"'.
        
        Use GoTokens to configure the Scanner such that it accepts all Go
        literal tokens including Go identifiers. Comments will be skipped.
    **/
    @:native("ScanInts") static var scanInts: go.GoInt;
    /**
        Predefined mode bits to control recognition of tokens. For instance,
        to configure a [Scanner] such that it only recognizes (Go) identifiers,
        integers, and skips comments, set the Scanner's Mode field to:
        
        	ScanIdents | ScanInts | ScanComments | SkipComments
        
        With the exceptions of comments, which are skipped if SkipComments is
        set, unrecognized tokens are not ignored. Instead, the scanner simply
        returns the respective individual characters (or possibly sub-tokens).
        For instance, if the mode is ScanIdents (not ScanStrings), the string
        "foo" is scanned as the token sequence '"' [Ident] '"'.
        
        Use GoTokens to configure the Scanner such that it accepts all Go
        literal tokens including Go identifiers. Comments will be skipped.
    **/
    @:native("ScanRawStrings") static var scanRawStrings: go.GoInt;
    /**
        Predefined mode bits to control recognition of tokens. For instance,
        to configure a [Scanner] such that it only recognizes (Go) identifiers,
        integers, and skips comments, set the Scanner's Mode field to:
        
        	ScanIdents | ScanInts | ScanComments | SkipComments
        
        With the exceptions of comments, which are skipped if SkipComments is
        set, unrecognized tokens are not ignored. Instead, the scanner simply
        returns the respective individual characters (or possibly sub-tokens).
        For instance, if the mode is ScanIdents (not ScanStrings), the string
        "foo" is scanned as the token sequence '"' [Ident] '"'.
        
        Use GoTokens to configure the Scanner such that it accepts all Go
        literal tokens including Go identifiers. Comments will be skipped.
    **/
    @:native("ScanStrings") static var scanStrings: go.GoInt;
    /**
        Predefined mode bits to control recognition of tokens. For instance,
        to configure a [Scanner] such that it only recognizes (Go) identifiers,
        integers, and skips comments, set the Scanner's Mode field to:
        
        	ScanIdents | ScanInts | ScanComments | SkipComments
        
        With the exceptions of comments, which are skipped if SkipComments is
        set, unrecognized tokens are not ignored. Instead, the scanner simply
        returns the respective individual characters (or possibly sub-tokens).
        For instance, if the mode is ScanIdents (not ScanStrings), the string
        "foo" is scanned as the token sequence '"' [Ident] '"'.
        
        Use GoTokens to configure the Scanner such that it accepts all Go
        literal tokens including Go identifiers. Comments will be skipped.
    **/
    @:native("SkipComments") static var skipComments: go.GoInt;
    /**
        The result of Scan is one of these tokens or a Unicode character.
    **/
    @:native("String") static var string: go.GoInt;

    /**
        TokenString returns a printable string for a token or Unicode character.
    **/
    @:native("TokenString") static function tokenString(tok: go.Rune): (std.String);

}