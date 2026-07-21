package go.go.ast;

@:structInit
@:go.Type({ name: "DirectiveArg", instanceName: "ast.DirectiveArg", imports: ["go/ast"] })
extern class DirectiveArg {

    @:native("Arg") var arg: String;
    @:native("Pos") var pos: go.go.token.Pos;

    function new(arg: String, pos: go.go.token.Pos);

}