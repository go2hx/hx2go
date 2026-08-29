package go.go.ast;

/**
    A SendStmt node represents a send statement.
**/
@:structInit
@:go.Type({ name: "SendStmt", instanceName: "ast.SendStmt", imports: ["go/ast"] })
extern class SendStmt {

    @:native("Chan") var chan: go.go.ast.Expr;
    @:native("Arrow") var arrow: go.go.token.Pos;
    @:native("Value") var value: go.go.ast.Expr;

    function new(chan: go.go.ast.Expr=null, arrow: go.go.token.Pos=cast 0, value: go.go.ast.Expr=null);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}