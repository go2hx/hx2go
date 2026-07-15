package go.go.ast;

@:structInit
@:go.Type({ name: "SwitchStmt", instanceName: "ast.SwitchStmt", imports: ["go/ast"] })
extern class SwitchStmt {

    @:native("Switch") var _switch: go.go.token.Pos;
    @:native("Init") var init: go.go.ast.Stmt;
    @:native("Tag") var tag: go.go.ast.Expr;
    @:native("Body") var body: go.Pointer<go.go.ast.BlockStmt>;

function new(_switch: go.go.token.Pos, init: go.go.ast.Stmt, tag: go.go.ast.Expr, body: go.Pointer<go.go.ast.BlockStmt>);

    @:native("End") function end(): go.go.token.Pos;
    @:native("Pos") function pos(): go.go.token.Pos;

}