package go.go.doc.comment;

/**
    A Doc is a parsed Go doc comment.
**/
@:structInit
@:go.Type({ name: "Doc", instanceName: "comment.Doc", imports: ["go/doc/comment"] })
extern class Doc {

    @:native("Content") var content: go.Slice<go.go.doc.comment.Block>;
    @:native("Links") var links: go.Slice<go.Pointer<go.go.doc.comment.LinkDef>>;

    function new(content: go.Slice<go.go.doc.comment.Block>=null, links: go.Slice<go.Pointer<go.go.doc.comment.LinkDef>>=null);

}