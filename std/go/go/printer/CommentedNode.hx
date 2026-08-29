package go.go.printer;

/**
    A CommentedNode bundles an AST node and corresponding comments.
    It may be provided as argument to any of the [Fprint] functions.
**/
@:structInit
@:go.Type({ name: "CommentedNode", instanceName: "printer.CommentedNode", imports: ["go/printer"] })
extern class CommentedNode {

    @:native("Node") var node: Dynamic;
    @:native("Comments") var comments: go.Slice<go.Pointer<go.go.ast.CommentGroup>>;

    function new(node: Dynamic=null, comments: go.Slice<go.Pointer<go.go.ast.CommentGroup>>=null);

}