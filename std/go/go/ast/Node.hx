package go.go.ast;

@:go.Type({ name: "Node", instanceName: "ast.Node", imports: ["go/ast"] })
extern typedef Node = {

    @:native("End") function end(): go.go.token.Pos;
    @:native("Pos") function pos(): go.go.token.Pos;

}