package go.go.doc.comment;

@:structInit
@:go.Type({ name: "LinkDef", instanceName: "comment.LinkDef", imports: ["go/doc/comment"] })
extern class LinkDef {

    @:native("Text") var text: String;
    @:native("URL") var URL: String;
    @:native("Used") var used: Bool;

    function new(text: String, URL: String, used: Bool);

}