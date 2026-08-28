package go.go.ast;

/**
    An ExprStmt node represents a (stand-alone) expression
    in a statement list.
**/
@:structInit
@:go.Type({ name: "ExprStmt", instanceName: "ast.ExprStmt", imports: ["go/ast"] })
extern class ExprStmt {

    @:native("X") var X: go.go.ast.Expr;

    function new(X: go.go.ast.Expr=null);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}