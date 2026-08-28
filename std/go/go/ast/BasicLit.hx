package go.go.ast;

/**
    A BasicLit node represents a literal of basic type.
    
    Note that for the CHAR and STRING kinds, the literal is stored
    with its quotes. For example, for a double-quoted STRING, the
    first and the last rune in the Value field will be ". The
    [strconv.Unquote] and [strconv.UnquoteChar] functions can be
    used to unquote STRING and CHAR values, respectively.
    
    For raw string literals (Kind == token.STRING && Value[0] == '`'),
    the Value field contains the string text without carriage returns (\r) that
    may have been present in the source.
**/
@:structInit
@:go.Type({ name: "BasicLit", instanceName: "ast.BasicLit", imports: ["go/ast"] })
extern class BasicLit {

    @:native("ValuePos") var valuePos: go.go.token.Pos;
    @:native("ValueEnd") var valueEnd: go.go.token.Pos;
    @:native("Kind") var kind: go.go.token.Token;
    @:native("Value") var value: String;

    function new(valuePos: go.go.token.Pos=cast 0, valueEnd: go.go.token.Pos=cast 0, kind: go.go.token.Token=cast 0, value: String="");

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}