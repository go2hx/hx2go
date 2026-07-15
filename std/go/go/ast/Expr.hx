package go.go.ast;

@:go.Type({ name: "Expr", instanceName: "ast.Expr", imports: ["go/ast"] })
extern typedef Expr = {

    @:native("End") function end(): go.go.token.Pos;
    @:native("Pos") function pos(): go.go.token.Pos;

}