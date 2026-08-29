package go.go.doc.comment;

/**
    A ListItem is a single item in a numbered or bullet list.
**/
@:structInit
@:go.Type({ name: "ListItem", instanceName: "comment.ListItem", imports: ["go/doc/comment"] })
extern class ListItem {

    @:native("Number") var number: String;
    @:native("Content") var content: go.Slice<go.go.doc.comment.Block>;

    function new(number: String="", content: go.Slice<go.go.doc.comment.Block>=null);

}