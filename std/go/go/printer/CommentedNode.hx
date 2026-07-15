package go.go.printer;

@:structInit
@:go.Type({ name: "CommentedNode", instanceName: "printer.CommentedNode", imports: ["go/printer"] })
extern class CommentedNode {

    @:native("Node") var node: Dynamic;
    @:native("Comments") var comments: go.Slice<go.Pointer<go.go.ast.CommentGroup>>;

function new(node: Dynamic, comments: go.Slice<go.Pointer<go.go.ast.CommentGroup>>);

}