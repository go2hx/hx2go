package go.go.ast;

/**
    A CommClause node represents a case of a select statement.
**/
@:structInit
@:go.Type({ name: "CommClause", instanceName: "ast.CommClause", imports: ["go/ast"] })
extern class CommClause {

    @:native("Case") var _case: go.go.token.Pos;
    @:native("Comm") var comm: go.go.ast.Stmt;
    @:native("Colon") var colon: go.go.token.Pos;
    @:native("Body") var body: go.Slice<go.go.ast.Stmt>;

    function new(_case: go.go.token.Pos=cast 0, comm: go.go.ast.Stmt=null, colon: go.go.token.Pos=cast 0, body: go.Slice<go.go.ast.Stmt>=null);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}