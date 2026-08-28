package go.go.ast;

/**
    An EmptyStmt node represents an empty statement.
    The "position" of the empty statement is the position
    of the immediately following (explicit or implicit) semicolon.
**/
@:structInit
@:go.Type({ name: "EmptyStmt", instanceName: "ast.EmptyStmt", imports: ["go/ast"] })
extern class EmptyStmt {

    @:native("Semicolon") var semicolon: go.go.token.Pos;
    @:native("Implicit") var implicit: Bool;

    function new(semicolon: go.go.token.Pos=cast 0, implicit: Bool=false);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}