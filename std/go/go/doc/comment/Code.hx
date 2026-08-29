package go.go.doc.comment;

/**
    A Code is a preformatted code block.
**/
@:structInit
@:go.Type({ name: "Code", instanceName: "comment.Code", imports: ["go/doc/comment"] })
extern class Code {

    @:native("Text") var text: String;

    function new(text: String="");

}