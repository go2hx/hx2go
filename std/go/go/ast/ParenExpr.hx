package go.go.ast;

@:structInit
@:go.Type({ name: "ParenExpr", instanceName: "ast.ParenExpr", imports: ["go/ast"] })
extern class ParenExpr {

    @:native("Lparen") var lparen: go.go.token.Pos;
    @:native("X") var X: go.go.ast.Expr;
    @:native("Rparen") var rparen: go.go.token.Pos;

function new(lparen: go.go.token.Pos, X: go.go.ast.Expr, rparen: go.go.token.Pos);

    @:native("End") function end(): go.go.token.Pos;
    @:native("Pos") function pos(): go.go.token.Pos;

}