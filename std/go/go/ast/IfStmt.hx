package go.go.ast;

/**
    An IfStmt node represents an if statement.
**/
@:structInit
@:go.Type({ name: "IfStmt", instanceName: "ast.IfStmt", imports: ["go/ast"] })
extern class IfStmt {

    @:native("If") var _if: go.go.token.Pos;
    @:native("Init") var init: go.go.ast.Stmt;
    @:native("Cond") var cond: go.go.ast.Expr;
    @:native("Body") var body: go.Pointer<go.go.ast.BlockStmt>;
    @:native("Else") var _else: go.go.ast.Stmt;

    function new(_if: go.go.token.Pos=cast 0, init: go.go.ast.Stmt=null, cond: go.go.ast.Expr=null, body: go.Pointer<go.go.ast.BlockStmt>=null, _else: go.go.ast.Stmt=null);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}