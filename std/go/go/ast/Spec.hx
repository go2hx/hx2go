package go.go.ast;

@:go.Type({ name: "Spec", instanceName: "ast.Spec", imports: ["go/ast"] })
extern typedef Spec = {

    @:native("End") function end(): (go.go.token.Pos);
    @:native("Pos") function pos(): (go.go.token.Pos);

}