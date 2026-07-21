package go.go.ast;

@:structInit
@:go.Type({ name: "IfStmt", instanceName: "ast.IfStmt", imports: ["go/ast"] })
extern class IfStmt {

    @:native("If") var _if: go.go.token.Pos;
    @:native("Init") var init: go.go.ast.Stmt;
    @:native("Cond") var cond: go.go.ast.Expr;
    @:native("Body") var body: go.Pointer<go.go.ast.BlockStmt>;
    @:native("Else") var _else: go.go.ast.Stmt;

    function new(_if: go.go.token.Pos, init: go.go.ast.Stmt, cond: go.go.ast.Expr, body: go.Pointer<go.go.ast.BlockStmt>, _else: go.go.ast.Stmt);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}