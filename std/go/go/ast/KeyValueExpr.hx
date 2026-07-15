package go.go.ast;

@:structInit
@:go.Type({ name: "KeyValueExpr", instanceName: "ast.KeyValueExpr", imports: ["go/ast"] })
extern class KeyValueExpr {

    @:native("Key") var key: go.go.ast.Expr;
    @:native("Colon") var colon: go.go.token.Pos;
    @:native("Value") var value: go.go.ast.Expr;

function new(key: go.go.ast.Expr, colon: go.go.token.Pos, value: go.go.ast.Expr);

    @:native("End") function end(): go.go.token.Pos;
    @:native("Pos") function pos(): go.go.token.Pos;

}