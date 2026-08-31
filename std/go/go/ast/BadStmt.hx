package go.go.ast;

/**
    A BadStmt node is a placeholder for statements containing
    syntax errors for which no correct statement nodes can be
    created.
**/
@:structInit
@:go.Type({ name: "BadStmt", instanceName: "ast.BadStmt", imports: ["go/ast"] })
extern class BadStmt {

    @:native("From") var _from: go.go.token.Pos;
    @:native("To") var _to: go.go.token.Pos;

    function new(_from: go.go.token.Pos=cast 0, _to: go.go.token.Pos=cast 0);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}