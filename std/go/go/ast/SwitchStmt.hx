package go.go.ast;

/**
    A SwitchStmt node represents an expression switch statement.
**/
@:structInit
@:go.Type({ name: "SwitchStmt", instanceName: "ast.SwitchStmt", imports: ["go/ast"] })
extern class SwitchStmt {

    @:native("Switch") var _switch: go.go.token.Pos;
    @:native("Init") var init: go.go.ast.Stmt;
    @:native("Tag") var tag: go.go.ast.Expr;
    @:native("Body") var body: go.Pointer<go.go.ast.BlockStmt>;

    function new(_switch: go.go.token.Pos=cast 0, init: go.go.ast.Stmt=null, tag: go.go.ast.Expr=null, body: go.Pointer<go.go.ast.BlockStmt>=null);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}