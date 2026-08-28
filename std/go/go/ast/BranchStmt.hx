package go.go.ast;

/**
    A BranchStmt node represents a break, continue, goto,
    or fallthrough statement.
**/
@:structInit
@:go.Type({ name: "BranchStmt", instanceName: "ast.BranchStmt", imports: ["go/ast"] })
extern class BranchStmt {

    @:native("TokPos") var tokPos: go.go.token.Pos;
    @:native("Tok") var tok: go.go.token.Token;
    @:native("Label") var label: go.Pointer<go.go.ast.Ident>;

    function new(tokPos: go.go.token.Pos=cast 0, tok: go.go.token.Token=cast 0, label: go.Pointer<go.go.ast.Ident>=null);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}