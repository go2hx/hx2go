package go.go.ast;

@:structInit
@:go.Type({ name: "ForStmt", instanceName: "ast.ForStmt", imports: ["go/ast"] })
extern class ForStmt {

    @:native("For") var _for: go.go.token.Pos;
    @:native("Init") var init: go.go.ast.Stmt;
    @:native("Cond") var cond: go.go.ast.Expr;
    @:native("Post") var post: go.go.ast.Stmt;
    @:native("Body") var body: go.Pointer<go.go.ast.BlockStmt>;

    function new(_for: go.go.token.Pos, init: go.go.ast.Stmt, cond: go.go.ast.Expr, post: go.go.ast.Stmt, body: go.Pointer<go.go.ast.BlockStmt>);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}