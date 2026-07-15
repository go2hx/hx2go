package go.go.ast;

@:structInit
@:go.Type({ name: "CommClause", instanceName: "ast.CommClause", imports: ["go/ast"] })
extern class CommClause {

    @:native("Case") var _case: go.go.token.Pos;
    @:native("Comm") var comm: go.go.ast.Stmt;
    @:native("Colon") var colon: go.go.token.Pos;
    @:native("Body") var body: go.Slice<go.go.ast.Stmt>;

function new(_case: go.go.token.Pos, comm: go.go.ast.Stmt, colon: go.go.token.Pos, body: go.Slice<go.go.ast.Stmt>);

    @:native("End") function end(): go.go.token.Pos;
    @:native("Pos") function pos(): go.go.token.Pos;

}