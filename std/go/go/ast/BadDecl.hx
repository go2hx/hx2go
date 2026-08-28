package go.go.ast;

/**
    A BadDecl node is a placeholder for a declaration containing
    syntax errors for which a correct declaration node cannot be
    created.
**/
@:structInit
@:go.Type({ name: "BadDecl", instanceName: "ast.BadDecl", imports: ["go/ast"] })
extern class BadDecl {

    @:native("From") var _from: go.go.token.Pos;
    @:native("To") var _to: go.go.token.Pos;

    function new(_from: go.go.token.Pos=cast 0, _to: go.go.token.Pos=cast 0);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}