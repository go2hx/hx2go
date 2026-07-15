package go.go.ast;

@:go.Type({ name: "Decl", instanceName: "ast.Decl", imports: ["go/ast"] })
extern typedef Decl = {

    @:native("End") function end(): go.go.token.Pos;
    @:native("Pos") function pos(): go.go.token.Pos;

}