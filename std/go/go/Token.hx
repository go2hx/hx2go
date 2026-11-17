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
    @:native("ADD") static final ADD: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("ADD_ASSIGN") static final ADD_ASSIGN: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("AND") static final AND: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("AND_ASSIGN") static final AND_ASSIGN: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("AND_NOT") static final AND_NOT: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("AND_NOT_ASSIGN") static final AND_NOT_ASSIGN: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("ARROW") static final ARROW: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("ASSIGN") static final ASSIGN: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("BREAK") static final BREAK: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("CASE") static final CASE: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("CHAN") static final CHAN: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("CHAR") static final CHAR: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("COLON") static final COLON: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("COMMA") static final COMMA: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("COMMENT") static final COMMENT: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("CONST") static final CONST: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("CONTINUE") static final CONTINUE: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("DEC") static final DEC: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("DEFAULT") static final DEFAULT: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("DEFER") static final DEFER: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("DEFINE") static final DEFINE: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("ELLIPSIS") static final ELLIPSIS: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("ELSE") static final ELSE: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("EOF") static final EOF: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("EQL") static final EQL: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("FALLTHROUGH") static final FALLTHROUGH: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("FLOAT") static final FLOAT: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("FOR") static final FOR: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("FUNC") static final FUNC: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("GEQ") static final GEQ: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("GO") static final GO: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("GOTO") static final GOTO: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("GTR") static final GTR: go.go.token.Token;
    /**
        A set of constants for precedence-based expression parsing.
        Non-operators have lowest precedence, followed by operators
        starting with precedence 1 up to unary operators. The highest
        precedence serves as "catch-all" precedence for selector,
        indexing, and other operator and delimiter tokens.
    **/
    @:native("HighestPrec") static final highestPrec: go.GoInt;
    /**
        The list of tokens.
    **/
    @:native("IDENT") static final IDENT: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("IF") static final IF: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("ILLEGAL") static final ILLEGAL: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("IMAG") static final IMAG: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("IMPORT") static final IMPORT: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("INC") static final INC: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("INT") static final INT: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("INTERFACE") static final INTERFACE: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("LAND") static final LAND: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("LBRACE") static final LBRACE: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("LBRACK") static final LBRACK: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("LEQ") static final LEQ: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("LOR") static final LOR: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("LPAREN") static final LPAREN: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("LSS") static final LSS: go.go.token.Token;
    /**
        A set of constants for precedence-based expression parsing.
        Non-operators have lowest precedence, followed by operators
        starting with precedence 1 up to unary operators. The highest
        precedence serves as "catch-all" precedence for selector,
        indexing, and other operator and delimiter tokens.
    **/
    @:native("LowestPrec") static final lowestPrec: go.GoInt;
    /**
        The list of tokens.
    **/
    @:native("MAP") static final MAP: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("MUL") static final MUL: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("MUL_ASSIGN") static final MUL_ASSIGN: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("NEQ") static final NEQ: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("NOT") static final NOT: go.go.token.Token;
    /**
        The zero value for [Pos] is NoPos; there is no file and line information
        associated with it, and NoPos.IsValid() is false. NoPos is always
        smaller than any other [Pos] value. The corresponding [Position] value
        for NoPos is the zero value for [Position].
    **/
    @:native("NoPos") static final noPos: go.go.token.Pos;
    /**
        The list of tokens.
    **/
    @:native("OR") static final OR: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("OR_ASSIGN") static final OR_ASSIGN: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("PACKAGE") static final PACKAGE: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("PERIOD") static final PERIOD: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("QUO") static final QUO: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("QUO_ASSIGN") static final QUO_ASSIGN: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("RANGE") static final RANGE: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("RBRACE") static final RBRACE: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("RBRACK") static final RBRACK: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("REM") static final REM: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("REM_ASSIGN") static final REM_ASSIGN: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("RETURN") static final RETURN: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("RPAREN") static final RPAREN: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("SELECT") static final SELECT: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("SEMICOLON") static final SEMICOLON: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("SHL") static final SHL: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("SHL_ASSIGN") static final SHL_ASSIGN: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("SHR") static final SHR: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("SHR_ASSIGN") static final SHR_ASSIGN: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("STRING") static final STRING: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("STRUCT") static final STRUCT: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("SUB") static final SUB: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("SUB_ASSIGN") static final SUB_ASSIGN: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("SWITCH") static final SWITCH: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("TILDE") static final TILDE: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("TYPE") static final TYPE: go.go.token.Token;
    /**
        A set of constants for precedence-based expression parsing.
        Non-operators have lowest precedence, followed by operators
        starting with precedence 1 up to unary operators. The highest
        precedence serves as "catch-all" precedence for selector,
        indexing, and other operator and delimiter tokens.
    **/
    @:native("UnaryPrec") static final unaryPrec: go.GoInt;
    /**
        The list of tokens.
    **/
    @:native("VAR") static final VAR: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("XOR") static final XOR: go.go.token.Token;
    /**
        The list of tokens.
    **/
    @:native("XOR_ASSIGN") static final XOR_ASSIGN: go.go.token.Token;

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