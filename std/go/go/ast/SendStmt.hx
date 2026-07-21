package go.go.ast;

@:structInit
@:go.Type({ name: "SendStmt", instanceName: "ast.SendStmt", imports: ["go/ast"] })
extern class SendStmt {

    @:native("Chan") var chan: go.go.ast.Expr;
    @:native("Arrow") var arrow: go.go.token.Pos;
    @:native("Value") var value: go.go.ast.Expr;

    function new(chan: go.go.ast.Expr, arrow: go.go.token.Pos, value: go.go.ast.Expr);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}