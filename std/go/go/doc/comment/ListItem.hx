package go.go.doc.comment;

@:structInit
@:go.Type({ name: "ListItem", instanceName: "comment.ListItem", imports: ["go/doc/comment"] })
extern class ListItem {

    @:native("Number") var number: String;
    @:native("Content") var content: go.Slice<go.go.doc.comment.Block>;

    function new(number: String, content: go.Slice<go.go.doc.comment.Block>);

}