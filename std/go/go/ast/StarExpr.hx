package go.go.ast;

@:structInit
@:go.Type({ name: "StarExpr", instanceName: "ast.StarExpr", imports: ["go/ast"] })
extern class StarExpr {

    @:native("Star") var star: go.go.token.Pos;
    @:native("X") var X: go.go.ast.Expr;

function new(star: go.go.token.Pos, X: go.go.ast.Expr);

    @:native("End") function end(): go.go.token.Pos;
    @:native("Pos") function pos(): go.go.token.Pos;

}