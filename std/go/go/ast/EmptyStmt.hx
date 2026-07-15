package go.go.ast;

@:structInit
@:go.Type({ name: "EmptyStmt", instanceName: "ast.EmptyStmt", imports: ["go/ast"] })
extern class EmptyStmt {

    @:native("Semicolon") var semicolon: go.go.token.Pos;
    @:native("Implicit") var implicit: Bool;

function new(semicolon: go.go.token.Pos, implicit: Bool);

    @:native("End") function end(): go.go.token.Pos;
    @:native("Pos") function pos(): go.go.token.Pos;

}