package go.go.ast;

@:go.Type({ name: "inspector", instanceName: "ast.inspector", imports: ["go/ast"] })
extern class Inspector {

    @:native("Visit") function visit(node: go.go.ast.Node): (go.go.ast.Visitor);

}