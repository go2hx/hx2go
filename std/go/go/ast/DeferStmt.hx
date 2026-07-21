package go.go.ast;

@:structInit
@:go.Type({ name: "DeferStmt", instanceName: "ast.DeferStmt", imports: ["go/ast"] })
extern class DeferStmt {

    @:native("Defer") var defer: go.go.token.Pos;
    @:native("Call") var call: go.Pointer<go.go.ast.CallExpr>;

    function new(defer: go.go.token.Pos, call: go.Pointer<go.go.ast.CallExpr>);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}