package go.go.doc.comment;

@:structInit
@:go.Type({ name: "Heading", instanceName: "comment.Heading", imports: ["go/doc/comment"] })
extern class Heading {

    @:native("Text") var text: go.Slice<go.go.doc.comment.Text>;

function new(text: go.Slice<go.go.doc.comment.Text>);

    @:native("DefaultID") function defaultID(): String;

}