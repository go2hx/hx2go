package go.go.ast;

@:structInit
@:go.Type({ name: "IncDecStmt", instanceName: "ast.IncDecStmt", imports: ["go/ast"] })
extern class IncDecStmt {

    @:native("X") var X: go.go.ast.Expr;
    @:native("TokPos") var tokPos: go.go.token.Pos;
    @:native("Tok") var tok: go.go.token.Token;

    function new(X: go.go.ast.Expr=null, tokPos: go.go.token.Pos=cast 0, tok: go.go.token.Token=cast 0);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}