package go.go.ast;

@:structInit
@:go.Type({ name: "SelectStmt", instanceName: "ast.SelectStmt", imports: ["go/ast"] })
extern class SelectStmt {

    @:native("Select") var select: go.go.token.Pos;
    @:native("Body") var body: go.Pointer<go.go.ast.BlockStmt>;

    function new(select: go.go.token.Pos=cast 0, body: go.Pointer<go.go.ast.BlockStmt>=null);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}