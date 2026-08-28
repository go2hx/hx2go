package go.go;

/**
    Package token defines constants representing the lexical tokens of the Go
    programming language and basic operations on tokens (printing, predicates).
**/
@:go.Type({ name: "token", instanceName: "token.token", imports: ["go/token"] })
extern class Token {

    /**
        The list of tokens.
    **/
    @:native("ADD") static var ADD: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("ADD_ASSIGN") static var ADD_ASSIGN: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("AND") static var AND: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("AND_ASSIGN") static var AND_ASSIGN: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("AND_NOT") static var AND_NOT: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("AND_NOT_ASSIGN") static var AND_NOT_ASSIGN: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("ARROW") static var ARROW: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("ASSIGN") static var ASSIGN: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("BREAK") static var BREAK: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("CASE") static var CASE: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("CHAN") static var CHAN: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("CHAR") static var CHAR: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("COLON") static var COLON: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("COMMA") static var COMMA: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("COMMENT") static var COMMENT: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("CONST") static var CONST: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("CONTINUE") static var CONTINUE: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("DEC") static var DEC: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("DEFAULT") static var DEFAULT: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("DEFER") static var DEFER: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("DEFINE") static var DEFINE: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("ELLIPSIS") static var ELLIPSIS: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("ELSE") static var ELSE: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("EOF") static var EOF: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("EQL") static var EQL: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("FALLTHROUGH") static var FALLTHROUGH: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("FLOAT") static var FLOAT: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("FOR") static var FOR: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("FUNC") static var FUNC: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("GEQ") static var GEQ: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("GO") static var GO: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("GOTO") static var GOTO: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("GTR") static var GTR: go.go.token.Token;
    /**
        A set of constants for precedence-based expression parsing.
        Non-operators have lowest precedence, followed by operators
        starting with precedence 1 up to unary operators. The highest
        precedence serves as "catch-all" precedence for selector,
        indexing, and other operator and delimiter tokens.
    **/
    @:native("HighestPrec") static var highestPrec: go.GoInt;
    /**
        The list of tokens.
    **/
    @:native("IDENT") static var IDENT: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("IF") static var IF: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("ILLEGAL") static var ILLEGAL: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("IMAG") static var IMAG: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("IMPORT") static var IMPORT: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("INC") static var INC: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("INT") static var INT: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("INTERFACE") static var INTERFACE: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("LAND") static var LAND: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("LBRACE") static var LBRACE: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("LBRACK") static var LBRACK: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("LEQ") static var LEQ: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("LOR") static var LOR: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("LPAREN") static var LPAREN: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("LSS") static var LSS: go.go.token.Token;
    /**
        A set of constants for precedence-based expression parsing.
        Non-operators have lowest precedence, followed by operators
        starting with precedence 1 up to unary operators. The highest
        precedence serves as "catch-all" precedence for selector,
        indexing, and other operator and delimiter tokens.
    **/
    @:native("LowestPrec") static var lowestPrec: go.GoInt;
    /**
        The list of tokens.
    **/
    @:native("MAP") static var MAP: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("MUL") static var MUL: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("MUL_ASSIGN") static var MUL_ASSIGN: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("NEQ") static var NEQ: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("NOT") static var NOT: go.go.token.Token;
    /**
        The zero value for [Pos] is NoPos; there is no file and line information
        associated with it, and NoPos.IsValid() is false. NoPos is always
        smaller than any other [Pos] value. The corresponding [Position] value
        for NoPos is the zero value for [Position].
    **/
    @:native("NoPos") static var noPos: go.go.token.Pos;
    /**
        The list of tokens.
    **/
    @:native("OR") static var OR: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("OR_ASSIGN") static var OR_ASSIGN: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("PACKAGE") static var PACKAGE: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("PERIOD") static var PERIOD: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("QUO") static var QUO: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("QUO_ASSIGN") static var QUO_ASSIGN: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("RANGE") static var RANGE: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("RBRACE") static var RBRACE: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("RBRACK") static var RBRACK: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("REM") static var REM: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("REM_ASSIGN") static var REM_ASSIGN: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("RETURN") static var RETURN: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("RPAREN") static var RPAREN: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("SELECT") static var SELECT: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("SEMICOLON") static var SEMICOLON: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("SHL") static var SHL: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("SHL_ASSIGN") static var SHL_ASSIGN: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("SHR") static var SHR: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("SHR_ASSIGN") static var SHR_ASSIGN: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("STRING") static var STRING: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("STRUCT") static var STRUCT: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("SUB") static var SUB: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("SUB_ASSIGN") static var SUB_ASSIGN: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("SWITCH") static var SWITCH: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("TILDE") static var TILDE: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("TYPE") static var TYPE: go.go.token.Token;
    /**
        A set of constants for precedence-based expression parsing.
        Non-operators have lowest precedence, followed by operators
        starting with precedence 1 up to unary operators. The highest
        precedence serves as "catch-all" precedence for selector,
        indexing, and other operator and delimiter tokens.
    **/
    @:native("UnaryPrec") static var unaryPrec: go.GoInt;
    /**
        The list of tokens.
    **/
    @:native("VAR") static var VAR: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("XOR") static var XOR: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("XOR_ASSIGN") static var XOR_ASSIGN: go.go.token.Token;

    /**
        IsExported reports whether name starts with an upper-case letter.
    **/
    @:native("IsExported") static function isExported(name: std.String): (Bool);
    /**
        IsIdentifier reports whether name is a Go identifier, that is, a non-empty
        string made up of letters, digits, and underscores, where the first character
        is not a digit. Keywords are not identifiers.
    **/
    @:native("IsIdentifier") static function isIdentifier(name: std.String): (Bool);
    /**
        IsKeyword reports whether name is a Go keyword, such as "func" or "return".
    **/
    @:native("IsKeyword") static function isKeyword(name: std.String): (Bool);
    /**
        Lookup maps an identifier to its keyword token or [IDENT] (if not a keyword).
    **/
    @:native("Lookup") static function lookup(ident: std.String): (go.go.token.Token);
    /**
        NewFileSet creates a new file set.
    **/
    @:native("NewFileSet") static function newFileSet(): (go.Pointer<go.go.token.FileSet>);

}