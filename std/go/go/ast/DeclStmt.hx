package go.go.ast;

/**
    A DeclStmt node represents a declaration in a statement list.
**/
@:structInit
@:go.Type({ name: "DeclStmt", instanceName: "ast.DeclStmt", imports: ["go/ast"] })
extern class DeclStmt {

    @:native("Decl") var decl: go.go.ast.Decl;

    function new(decl: go.go.ast.Decl=null);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}