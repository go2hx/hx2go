package go.go.token;

/**
    Token is the set of lexical tokens of the Go programming language.
**/
@:go.Type({ name: "Token", instanceName: "token.Token", imports: ["go/token"] })
extern typedef Token = haxe.extern.EitherType<go.GoInt, {
    /**
        IsKeyword returns true for tokens corresponding to keywords;
        it returns false otherwise.
    **/
    @:native("IsKeyword") function isKeyword(): (Bool);
    /**
        IsLiteral returns true for tokens corresponding to identifiers
        and basic type literals; it returns false otherwise.
    **/
    @:native("IsLiteral") function isLiteral(): (Bool);
    /**
        IsOperator returns true for tokens corresponding to operators and
        delimiters; it returns false otherwise.
    **/
    @:native("IsOperator") function isOperator(): (Bool);
    /**
        Precedence returns the operator precedence of the binary
        operator op. If op is not a binary operator, the result
        is LowestPrecedence.
    **/
    @:native("Precedence") function precedence(): (go.GoInt);
    /**
        String returns the string corresponding to the token tok.
        For operators, delimiters, and keywords the string is the actual
        token character sequence (e.g., for the token [ADD], the string is
        "+"). For all other tokens the string corresponds to the token
        constant name (e.g. for the token [IDENT], the string is "IDENT").
    **/
    @:native("String") function string(): (std.String);

}>