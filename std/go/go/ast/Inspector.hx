package go.go.ast;

@:go.Type({ name: "inspector", instanceName: "ast.inspector", imports: ["go/ast"] })
extern typedef Inspector = haxe.extern.EitherType<(p0: go.go.ast.Node) -> (Bool), {
    @:native("Visit") function visit(node: go.go.ast.Node): (go.go.ast.Visitor);

}>