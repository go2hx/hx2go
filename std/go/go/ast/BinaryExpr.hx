package go.go.ast;

@:structInit
@:go.Type({ name: "BinaryExpr", instanceName: "ast.BinaryExpr", imports: ["go/ast"] })
extern class BinaryExpr {

    @:native("X") var X: go.go.ast.Expr;
    @:native("OpPos") var opPos: go.go.token.Pos;
    @:native("Op") var op: go.go.token.Token;
    @:native("Y") var Y: go.go.ast.Expr;

    function new(X: go.go.ast.Expr=null, opPos: go.go.token.Pos=cast 0, op: go.go.token.Token=cast 0, Y: go.go.ast.Expr=null);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}