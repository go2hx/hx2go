package go.go.ast;

@:structInit
@:go.Type({ name: "LabeledStmt", instanceName: "ast.LabeledStmt", imports: ["go/ast"] })
extern class LabeledStmt {

    @:native("Label") var label: go.Pointer<go.go.ast.Ident>;
    @:native("Colon") var colon: go.go.token.Pos;
    @:native("Stmt") var stmt: go.go.ast.Stmt;

function new(label: go.Pointer<go.go.ast.Ident>, colon: go.go.token.Pos, stmt: go.go.ast.Stmt);

    @:native("End") function end(): go.go.token.Pos;
    @:native("Pos") function pos(): go.go.token.Pos;

}