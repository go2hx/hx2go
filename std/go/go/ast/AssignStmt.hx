package go.go.ast;

@:structInit
@:go.Type({ name: "AssignStmt", instanceName: "ast.AssignStmt", imports: ["go/ast"] })
extern class AssignStmt {

    @:native("Lhs") var lhs: go.Slice<go.go.ast.Expr>;
    @:native("TokPos") var tokPos: go.go.token.Pos;
    @:native("Tok") var tok: go.go.token.Token;
    @:native("Rhs") var rhs: go.Slice<go.go.ast.Expr>;

function new(lhs: go.Slice<go.go.ast.Expr>, tokPos: go.go.token.Pos, tok: go.go.token.Token, rhs: go.Slice<go.go.ast.Expr>);

    @:native("End") function end(): go.go.token.Pos;
    @:native("Pos") function pos(): go.go.token.Pos;

}