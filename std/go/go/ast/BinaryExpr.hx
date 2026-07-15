package go.go.ast;

@:structInit
@:go.Type({ name: "BinaryExpr", instanceName: "ast.BinaryExpr", imports: ["go/ast"] })
extern class BinaryExpr {

    @:native("X") var X: go.go.ast.Expr;
    @:native("OpPos") var opPos: go.go.token.Pos;
    @:native("Op") var op: go.go.token.Token;
    @:native("Y") var Y: go.go.ast.Expr;

function new(X: go.go.ast.Expr, opPos: go.go.token.Pos, op: go.go.token.Token, Y: go.go.ast.Expr);

    @:native("End") function end(): go.go.token.Pos;
    @:native("Pos") function pos(): go.go.token.Pos;

}