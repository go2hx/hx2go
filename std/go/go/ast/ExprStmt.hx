package go.go.ast;

@:structInit
@:go.Type({ name: "ExprStmt", instanceName: "ast.ExprStmt", imports: ["go/ast"] })
extern class ExprStmt {

    @:native("X") var X: go.go.ast.Expr;

function new(X: go.go.ast.Expr);

    @:native("End") function end(): go.go.token.Pos;
    @:native("Pos") function pos(): go.go.token.Pos;

}