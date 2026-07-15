package go.go.doc.comment;

@:structInit
@:go.Type({ name: "DocLink", instanceName: "comment.DocLink", imports: ["go/doc/comment"] })
extern class DocLink {

    @:native("Text") var text: go.Slice<go.go.doc.comment.Text>;
    @:native("ImportPath") var importPath: String;
    @:native("Recv") var recv: String;
    @:native("Name") var name: String;

function new(text: go.Slice<go.go.doc.comment.Text>, importPath: String, recv: String, name: String);

    @:native("DefaultURL") function defaultURL(baseURL: String): String;

}