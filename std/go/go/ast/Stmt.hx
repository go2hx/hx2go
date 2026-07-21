package go.go.ast;

@:go.Type({ name: "Stmt", instanceName: "ast.Stmt", imports: ["go/ast"] })
extern typedef Stmt = {

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}