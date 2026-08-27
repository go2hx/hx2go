package go.go.ast;

@:structInit
@:go.Type({ name: "IndexListExpr", instanceName: "ast.IndexListExpr", imports: ["go/ast"] })
extern class IndexListExpr {

    @:native("X") var X: go.go.ast.Expr;
    @:native("Lbrack") var lbrack: go.go.token.Pos;
    @:native("Indices") var indices: go.Slice<go.go.ast.Expr>;
    @:native("Rbrack") var rbrack: go.go.token.Pos;

    function new(X: go.go.ast.Expr=null, lbrack: go.go.token.Pos=cast 0, indices: go.Slice<go.go.ast.Expr>=null, rbrack: go.go.token.Pos=cast 0);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}