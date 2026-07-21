package go.go.ast;

@:structInit
@:go.Type({ name: "CallExpr", instanceName: "ast.CallExpr", imports: ["go/ast"] })
extern class CallExpr {

    @:native("Fun") var fun: go.go.ast.Expr;
    @:native("Lparen") var lparen: go.go.token.Pos;
    @:native("Args") var args: go.Slice<go.go.ast.Expr>;
    @:native("Ellipsis") var ellipsis: go.go.token.Pos;
    @:native("Rparen") var rparen: go.go.token.Pos;

    function new(fun: go.go.ast.Expr, lparen: go.go.token.Pos, args: go.Slice<go.go.ast.Expr>, ellipsis: go.go.token.Pos, rparen: go.go.token.Pos);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}