package go.go.ast;

@:structInit
@:go.Type({ name: "GoStmt", instanceName: "ast.GoStmt", imports: ["go/ast"] })
extern class GoStmt {

    @:native("Go") var go: go.go.token.Pos;
    @:native("Call") var call: go.Pointer<go.go.ast.CallExpr>;

    function new(go: go.go.token.Pos, call: go.Pointer<go.go.ast.CallExpr>);

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}