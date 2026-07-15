package go.go.doc;

@:structInit
@:go.Type({ name: "Example", instanceName: "doc.Example", imports: ["go/doc"] })
extern class Example {

    @:native("Name") var name: String;
    @:native("Suffix") var suffix: String;
    @:native("Doc") var doc: String;
    @:native("Code") var code: go.go.ast.Node;
    @:native("Play") var play: go.Pointer<go.go.ast.File>;
    @:native("Comments") var comments: go.Slice<go.Pointer<go.go.ast.CommentGroup>>;
    @:native("Output") var output: String;
    @:native("Unordered") var unordered: Bool;
    @:native("EmptyOutput") var emptyOutput: Bool;
    @:native("Order") var order: go.GoInt;

function new(name: String, suffix: String, doc: String, code: go.go.ast.Node, play: go.Pointer<go.go.ast.File>, comments: go.Slice<go.Pointer<go.go.ast.CommentGroup>>, output: String, unordered: Bool, emptyOutput: Bool, order: go.GoInt);

}