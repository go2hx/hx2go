package go.go.ast;

/**
    A ReturnStmt node represents a return statement.
**/
@:structInit
@:go.Type({ name: "ReturnStmt", instanceName: "ast.ReturnStmt", imports: ["go/ast"] })
extern class ReturnStmt {

    @:native("Return") var _return: go.go.token.Pos;
    @:native("Results") var results: go.Slice<go.go.ast.Expr>;

    function new(_return: go.go.token.Pos=cast 0, results: go.Slice<go.go.ast.Expr>=null);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}