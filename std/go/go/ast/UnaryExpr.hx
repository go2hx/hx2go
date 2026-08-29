package go.go.ast;

/**
    A UnaryExpr node represents a unary expression.
    Unary "*" expressions are represented via StarExpr nodes.
**/
@:structInit
@:go.Type({ name: "UnaryExpr", instanceName: "ast.UnaryExpr", imports: ["go/ast"] })
extern class UnaryExpr {

    @:native("OpPos") var opPos: go.go.token.Pos;
    @:native("Op") var op: go.go.token.Token;
    @:native("X") var X: go.go.ast.Expr;

    function new(opPos: go.go.token.Pos=cast 0, op: go.go.token.Token=cast 0, X: go.go.ast.Expr=null);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}