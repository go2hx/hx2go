package go.go.doc.comment;

@:structInit
@:go.Type({ name: "Link", instanceName: "comment.Link", imports: ["go/doc/comment"] })
extern class Link {

    @:native("Auto") var auto: Bool;
    @:native("Text") var text: go.Slice<go.go.doc.comment.Text>;
    @:native("URL") var URL: String;

    function new(auto: Bool, text: go.Slice<go.go.doc.comment.Text>, URL: String);

}