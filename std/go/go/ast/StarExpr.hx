package go.go.ast;

/**
    A StarExpr node represents an expression of the form "*" Expression.
    Semantically it could be a unary "*" expression, or a pointer type.
**/
@:structInit
@:go.Type({ name: "StarExpr", instanceName: "ast.StarExpr", imports: ["go/ast"] })
extern class StarExpr {

    @:native("Star") var star: go.go.token.Pos;
    @:native("X") var X: go.go.ast.Expr;

    function new(star: go.go.token.Pos=cast 0, X: go.go.ast.Expr=null);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}