package go.go.ast;

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

    function new(_for: go.go.token.Pos, key: go.go.ast.Expr, value: go.go.ast.Expr, tokPos: go.go.token.Pos, tok: go.go.token.Token, range: go.go.token.Pos, X: go.go.ast.Expr, body: go.Pointer<go.go.ast.BlockStmt>);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}