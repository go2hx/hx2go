package go.go.ast;

/**
    An IndexExpr node represents an expression followed by an index.
**/
@:structInit
@:go.Type({ name: "IndexExpr", instanceName: "ast.IndexExpr", imports: ["go/ast"] })
extern class IndexExpr {

    @:native("X") var X: go.go.ast.Expr;
    @:native("Lbrack") var lbrack: go.go.token.Pos;
    @:native("Index") var index: go.go.ast.Expr;
    @:native("Rbrack") var rbrack: go.go.token.Pos;

    function new(X: go.go.ast.Expr=null, lbrack: go.go.token.Pos=cast 0, index: go.go.ast.Expr=null, rbrack: go.go.token.Pos=cast 0);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}