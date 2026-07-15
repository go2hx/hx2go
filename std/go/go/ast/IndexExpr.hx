package go.go.ast;

@:structInit
@:go.Type({ name: "IndexExpr", instanceName: "ast.IndexExpr", imports: ["go/ast"] })
extern class IndexExpr {

    @:native("X") var X: go.go.ast.Expr;
    @:native("Lbrack") var lbrack: go.go.token.Pos;
    @:native("Index") var index: go.go.ast.Expr;
    @:native("Rbrack") var rbrack: go.go.token.Pos;

function new(X: go.go.ast.Expr, lbrack: go.go.token.Pos, index: go.go.ast.Expr, rbrack: go.go.token.Pos);

    @:native("End") function end(): go.go.token.Pos;
    @:native("Pos") function pos(): go.go.token.Pos;

}