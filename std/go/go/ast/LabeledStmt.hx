package go.go.ast;

/**
    A LabeledStmt node represents a labeled statement.
**/
@:structInit
@:go.Type({ name: "LabeledStmt", instanceName: "ast.LabeledStmt", imports: ["go/ast"] })
extern class LabeledStmt {

    @:native("Label") var label: go.Pointer<go.go.ast.Ident>;
    @:native("Colon") var colon: go.go.token.Pos;
    @:native("Stmt") var stmt: go.go.ast.Stmt;

    function new(label: go.Pointer<go.go.ast.Ident>=null, colon: go.go.token.Pos=cast 0, stmt: go.go.ast.Stmt=null);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}