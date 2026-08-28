package go.go.ast;

/**
    A Directive is a comment of this form:
    
    	//tool:name args
    
    For example, this directive:
    
    	//go:generate stringer -type Op -trimprefix Op
    
    would have Tool "go", Name "generate", and Args "stringer -type Op
    -trimprefix Op".
    
    While Args does not have a strict syntax, by convention it is a
    space-separated sequence of unquoted words, '"'-quoted Go strings, or
    '`'-quoted raw strings.
    
    See https://go.dev/doc/comment#directives for specification.
**/
@:structInit
@:go.Type({ name: "Directive", instanceName: "ast.Directive", imports: ["go/ast"] })
extern class Directive {

    @:native("Tool") var tool: String;
    @:native("Name") var name: String;
    @:native("Args") var args: String;
    @:native("Slash") var slash: go.go.token.Pos;
    @:native("ArgsPos") var argsPos: go.go.token.Pos;

    function new(tool: String="", name: String="", args: String="", slash: go.go.token.Pos=cast 0, argsPos: go.go.token.Pos=cast 0);

    @:native("End") function end(): (go.go.token.Pos);
    /**
        ParseArgs parses a [Directive]'s arguments using the standard convention,
        which is a sequence of tokens, where each token may be a bare word, or a
        double quoted Go string, or a back quoted raw Go string. Each token must be
        separated by one or more Unicode spaces.
        
        If the arguments do not conform to this syntax, it returns an error.
    **/
    @:native("ParseArgs") function parseArgs(): (go.Result<go.Slice<go.go.ast.DirectiveArg>>);
    @:native("Pos") function pos(): (go.go.token.Pos);

}