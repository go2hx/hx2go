package go.go.ast;

/**
    A CallExpr node represents an expression followed by an argument list.
**/
@:structInit
@:go.Type({ name: "CallExpr", instanceName: "ast.CallExpr", imports: ["go/ast"] })
extern class CallExpr {

    @:native("Fun") var fun: go.go.ast.Expr;
    @:native("Lparen") var lparen: go.go.token.Pos;
    @:native("Args") var args: go.Slice<go.go.ast.Expr>;
    @:native("Ellipsis") var ellipsis: go.go.token.Pos;
    @:native("Rparen") var rparen: go.go.token.Pos;

    function new(fun: go.go.ast.Expr=null, lparen: go.go.token.Pos=cast 0, args: go.Slice<go.go.ast.Expr>=null, ellipsis: go.go.token.Pos=cast 0, rparen: go.go.token.Pos=cast 0);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}