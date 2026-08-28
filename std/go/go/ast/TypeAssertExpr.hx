package go.go.ast;

/**
    A TypeAssertExpr node represents an expression followed by a
    type assertion.
**/
@:structInit
@:go.Type({ name: "TypeAssertExpr", instanceName: "ast.TypeAssertExpr", imports: ["go/ast"] })
extern class TypeAssertExpr {

    @:native("X") var X: go.go.ast.Expr;
    @:native("Lparen") var lparen: go.go.token.Pos;
    @:native("Type") var type: go.go.ast.Expr;
    @:native("Rparen") var rparen: go.go.token.Pos;

    function new(X: go.go.ast.Expr=null, lparen: go.go.token.Pos=cast 0, type: go.go.ast.Expr=null, rparen: go.go.token.Pos=cast 0);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}