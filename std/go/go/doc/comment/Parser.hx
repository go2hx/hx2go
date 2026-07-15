package go.go.doc.comment;

@:structInit
@:go.Type({ name: "Parser", instanceName: "comment.Parser", imports: ["go/doc/comment"] })
extern class Parser {

    @:native("Words") var words: go.Map<String, String>;
    @:native("LookupPackage") var lookupPackage: (name: String) -> go.Tuple<{ importPath: String, ok: Bool }>;
    @:native("LookupSym") var lookupSym: (recv: String, name: String) -> Bool;

function new(words: go.Map<String, String>, lookupPackage: (name: String) -> go.Tuple<{ importPath: String, ok: Bool }>, lookupSym: (recv: String, name: String) -> Bool);

    @:native("Parse") function parse(text: String): go.Pointer<go.go.doc.comment.Doc>;

}