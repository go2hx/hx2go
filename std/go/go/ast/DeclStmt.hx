package go.go.ast;

@:structInit
@:go.Type({ name: "DeclStmt", instanceName: "ast.DeclStmt", imports: ["go/ast"] })
extern class DeclStmt {

    @:native("Decl") var decl: go.go.ast.Decl;

function new(decl: go.go.ast.Decl);

    @:native("End") function end(): go.go.token.Pos;
    @:native("Pos") function pos(): go.go.token.Pos;

}