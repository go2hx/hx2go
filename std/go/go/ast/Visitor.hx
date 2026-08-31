package go.go.ast;

/**
    A Visitor's Visit method is invoked for each node encountered by [Walk].
    If the result visitor w is not nil, [Walk] visits each of the children
    of node with the visitor w, followed by a call of w.Visit(nil).
**/
@:go.Type({ name: "Visitor", instanceName: "ast.Visitor", imports: ["go/ast"] })
extern typedef Visitor = {

    @:native("Visit") function visit(node: go.go.ast.Node): (go.go.ast.Visitor);

}