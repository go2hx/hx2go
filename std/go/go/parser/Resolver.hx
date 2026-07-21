package go.go.parser;

@:structInit
@:go.Type({ name: "resolver", instanceName: "parser.resolver", imports: ["go/parser"] })
extern class Resolver {

    @:native("Visit") function visit(node: go.go.ast.Node): (go.go.ast.Visitor);

}