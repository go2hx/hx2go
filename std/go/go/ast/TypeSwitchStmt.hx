package go.go.ast;

/**
    A TypeSwitchStmt node represents a type switch statement.
**/
@:structInit
@:go.Type({ name: "TypeSwitchStmt", instanceName: "ast.TypeSwitchStmt", imports: ["go/ast"] })
extern class TypeSwitchStmt {

    @:native("Switch") var _switch: go.go.token.Pos;
    @:native("Init") var init: go.go.ast.Stmt;
    @:native("Assign") var assign: go.go.ast.Stmt;
    @:native("Body") var body: go.Pointer<go.go.ast.BlockStmt>;

    function new(_switch: go.go.token.Pos=cast 0, init: go.go.ast.Stmt=null, assign: go.go.ast.Stmt=null, body: go.Pointer<go.go.ast.BlockStmt>=null);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}