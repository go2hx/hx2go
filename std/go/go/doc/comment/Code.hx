package go.go.doc.comment;

@:structInit
@:go.Type({ name: "Code", instanceName: "comment.Code", imports: ["go/doc/comment"] })
extern class Code {

    @:native("Text") var text: String;

    function new(text: String);

}