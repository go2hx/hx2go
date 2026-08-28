package go.go.ast;

/**
    An AssignStmt node represents an assignment or
    a short variable declaration.
**/
@:structInit
@:go.Type({ name: "AssignStmt", instanceName: "ast.AssignStmt", imports: ["go/ast"] })
extern class AssignStmt {

    @:native("Lhs") var lhs: go.Slice<go.go.ast.Expr>;
    @:native("TokPos") var tokPos: go.go.token.Pos;
    @:native("Tok") var tok: go.go.token.Token;
    @:native("Rhs") var rhs: go.Slice<go.go.ast.Expr>;

    function new(lhs: go.Slice<go.go.ast.Expr>=null, tokPos: go.go.token.Pos=cast 0, tok: go.go.token.Token=cast 0, rhs: go.Slice<go.go.ast.Expr>=null);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}