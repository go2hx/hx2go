package go.go.ast;

@:structInit
@:go.Type({ name: "TypeSwitchStmt", instanceName: "ast.TypeSwitchStmt", imports: ["go/ast"] })
extern class TypeSwitchStmt {

    @:native("Switch") var _switch: go.go.token.Pos;
    @:native("Init") var init: go.go.ast.Stmt;
    @:native("Assign") var assign: go.go.ast.Stmt;
    @:native("Body") var body: go.Pointer<go.go.ast.BlockStmt>;

function new(_switch: go.go.token.Pos, init: go.go.ast.Stmt, assign: go.go.ast.Stmt, body: go.Pointer<go.go.ast.BlockStmt>);

    @:native("End") function end(): go.go.token.Pos;
    @:native("Pos") function pos(): go.go.token.Pos;

}