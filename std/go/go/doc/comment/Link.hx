package go.go.doc.comment;

/**
    A Link is a link to a specific URL.
**/
@:structInit
@:go.Type({ name: "Link", instanceName: "comment.Link", imports: ["go/doc/comment"] })
extern class Link {

    @:native("Auto") var auto: Bool;
    @:native("Text") var text: go.Slice<go.go.doc.comment.Text>;
    @:native("URL") var URL: String;

    function new(auto: Bool=false, text: go.Slice<go.go.doc.comment.Text>=null, URL: String="");

}