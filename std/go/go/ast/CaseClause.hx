package go.go.ast;

@:structInit
@:go.Type({ name: "CaseClause", instanceName: "ast.CaseClause", imports: ["go/ast"] })
extern class CaseClause {

    @:native("Case") var _case: go.go.token.Pos;
    @:native("List") var list: go.Slice<go.go.ast.Expr>;
    @:native("Colon") var colon: go.go.token.Pos;
    @:native("Body") var body: go.Slice<go.go.ast.Stmt>;

    function new(_case: go.go.token.Pos=cast 0, list: go.Slice<go.go.ast.Expr>=null, colon: go.go.token.Pos=cast 0, body: go.Slice<go.go.ast.Stmt>=null);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}