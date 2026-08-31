package go.go.ast;

/**
    A ForStmt represents a for statement.
**/
@:structInit
@:go.Type({ name: "ForStmt", instanceName: "ast.ForStmt", imports: ["go/ast"] })
extern class ForStmt {

    @:native("For") var _for: go.go.token.Pos;
    @:native("Init") var init: go.go.ast.Stmt;
    @:native("Cond") var cond: go.go.ast.Expr;
    @:native("Post") var post: go.go.ast.Stmt;
    @:native("Body") var body: go.Pointer<go.go.ast.BlockStmt>;

    function new(_for: go.go.token.Pos=cast 0, init: go.go.ast.Stmt=null, cond: go.go.ast.Expr=null, post: go.go.ast.Stmt=null, body: go.Pointer<go.go.ast.BlockStmt>=null);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}