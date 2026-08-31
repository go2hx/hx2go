package go.go.ast;

/**
    A RangeStmt represents a for statement with a range clause.
**/
@:structInit
@:go.Type({ name: "RangeStmt", instanceName: "ast.RangeStmt", imports: ["go/ast"] })
extern class RangeStmt {

    @:native("For") var _for: go.go.token.Pos;
    @:native("Key") var key: go.go.ast.Expr;
    @:native("Value") var value: go.go.ast.Expr;
    @:native("TokPos") var tokPos: go.go.token.Pos;
    @:native("Tok") var tok: go.go.token.Token;
    @:native("Range") var range: go.go.token.Pos;
    @:native("X") var X: go.go.ast.Expr;
    @:native("Body") var body: go.Pointer<go.go.ast.BlockStmt>;

    function new(_for: go.go.token.Pos=cast 0, key: go.go.ast.Expr=null, value: go.go.ast.Expr=null, tokPos: go.go.token.Pos=cast 0, tok: go.go.token.Token=cast 0, range: go.go.token.Pos=cast 0, X: go.go.ast.Expr=null, body: go.Pointer<go.go.ast.BlockStmt>=null);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}