package go.go.ast;

@:structInit
@:go.Type({ name: "ReturnStmt", instanceName: "ast.ReturnStmt", imports: ["go/ast"] })
extern class ReturnStmt {

    @:native("Return") var _return: go.go.token.Pos;
    @:native("Results") var results: go.Slice<go.go.ast.Expr>;

    function new(_return: go.go.token.Pos, results: go.Slice<go.go.ast.Expr>);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}