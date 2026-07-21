package go.go.ast;

@:structInit
@:go.Type({ name: "TypeAssertExpr", instanceName: "ast.TypeAssertExpr", imports: ["go/ast"] })
extern class TypeAssertExpr {

    @:native("X") var X: go.go.ast.Expr;
    @:native("Lparen") var lparen: go.go.token.Pos;
    @:native("Type") var type: go.go.ast.Expr;
    @:native("Rparen") var rparen: go.go.token.Pos;

    function new(X: go.go.ast.Expr, lparen: go.go.token.Pos, type: go.go.ast.Expr, rparen: go.go.token.Pos);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}