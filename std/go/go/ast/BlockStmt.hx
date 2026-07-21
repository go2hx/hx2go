package go.go.ast;

@:structInit
@:go.Type({ name: "BlockStmt", instanceName: "ast.BlockStmt", imports: ["go/ast"] })
extern class BlockStmt {

    @:native("Lbrace") var lbrace: go.go.token.Pos;
    @:native("List") var list: go.Slice<go.go.ast.Stmt>;
    @:native("Rbrace") var rbrace: go.go.token.Pos;

    function new(lbrace: go.go.token.Pos, list: go.Slice<go.go.ast.Stmt>, rbrace: go.go.token.Pos);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}