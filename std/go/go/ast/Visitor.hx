package go.go.ast;

@:go.Type({ name: "Visitor", instanceName: "ast.Visitor", imports: ["go/ast"] })
extern typedef Visitor = {

    @:native("Visit") function visit(node: go.go.ast.Node): (go.go.ast.Visitor);

}