package go.go.doc.comment;

@:structInit
@:go.Type({ name: "parseDoc", instanceName: "comment.parseDoc", imports: ["go/doc/comment"] })
extern class ParseDoc {

    @:native("Parser") var parser: go.Pointer<go.go.doc.comment.Parser>;
    @:native("Doc") var doc: go.Pointer<go.go.doc.comment.Doc>;
    @:native("Words") var words: go.Map<String, String>;
    @:native("LookupPackage") var lookupPackage: (name: String) -> (go.Tuple<{ importPath: String, ok: Bool }>);
    @:native("LookupSym") var lookupSym: (recv: String, name: String) -> (Bool);
    @:native("Content") var content: go.Slice<go.go.doc.comment.Block>;
    @:native("Links") var links: go.Slice<go.Pointer<go.go.doc.comment.LinkDef>>;

    function new(parser: go.Pointer<go.go.doc.comment.Parser>, doc: go.Pointer<go.go.doc.comment.Doc>);

    @:native("Parse") function parse(text: String): (go.Pointer<go.go.doc.comment.Doc>);

}