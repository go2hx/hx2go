package go.go.ast;

@:structInit
@:go.Type({ name: "UnaryExpr", instanceName: "ast.UnaryExpr", imports: ["go/ast"] })
extern class UnaryExpr {

    @:native("OpPos") var opPos: go.go.token.Pos;
    @:native("Op") var op: go.go.token.Token;
    @:native("X") var X: go.go.ast.Expr;

function new(opPos: go.go.token.Pos, op: go.go.token.Token, X: go.go.ast.Expr);

    @:native("End") function end(): go.go.token.Pos;
    @:native("Pos") function pos(): go.go.token.Pos;

}