package go.go.doc.comment;

@:structInit
@:go.Type({ name: "Paragraph", instanceName: "comment.Paragraph", imports: ["go/doc/comment"] })
extern class Paragraph {

    @:native("Text") var text: go.Slice<go.go.doc.comment.Text>;

function new(text: go.Slice<go.go.doc.comment.Text>);

}