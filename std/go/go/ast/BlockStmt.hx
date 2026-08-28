package go.go.ast;

/**
    A BlockStmt node represents a braced statement list.
**/
@:structInit
@:go.Type({ name: "BlockStmt", instanceName: "ast.BlockStmt", imports: ["go/ast"] })
extern class BlockStmt {

    @:native("Lbrace") var lbrace: go.go.token.Pos;
    @:native("List") var list: go.Slice<go.go.ast.Stmt>;
    @:native("Rbrace") var rbrace: go.go.token.Pos;

    function new(lbrace: go.go.token.Pos=cast 0, list: go.Slice<go.go.ast.Stmt>=null, rbrace: go.go.token.Pos=cast 0);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}