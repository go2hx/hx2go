package go.go.ast;

@:structInit
@:go.Type({ name: "SelectStmt", instanceName: "ast.SelectStmt", imports: ["go/ast"] })
extern class SelectStmt {

    @:native("Select") var select: go.go.token.Pos;
    @:native("Body") var body: go.Pointer<go.go.ast.BlockStmt>;

function new(select: go.go.token.Pos, body: go.Pointer<go.go.ast.BlockStmt>);

    @:native("End") function end(): go.go.token.Pos;
    @:native("Pos") function pos(): go.go.token.Pos;

}