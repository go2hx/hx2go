package go.go.doc.comment;

/**
    A Paragraph is a paragraph of text.
**/
@:structInit
@:go.Type({ name: "Paragraph", instanceName: "comment.Paragraph", imports: ["go/doc/comment"] })
extern class Paragraph {

    @:native("Text") var text: go.Slice<go.go.doc.comment.Text>;

    function new(text: go.Slice<go.go.doc.comment.Text>=null);

}