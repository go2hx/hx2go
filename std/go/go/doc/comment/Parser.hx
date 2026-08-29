package go.go.doc.comment;

/**
    A Parser is a doc comment parser.
    The fields in the struct can be filled in before calling [Parser.Parse]
    in order to customize the details of the parsing process.
**/
@:structInit
@:go.Type({ name: "Parser", instanceName: "comment.Parser", imports: ["go/doc/comment"] })
extern class Parser {

    @:native("Words") var words: go.Map<String, String>;
    @:native("LookupPackage") var lookupPackage: (name: String) -> (go.Tuple<{ importPath: String, ok: Bool }>);
    @:native("LookupSym") var lookupSym: (recv: String, name: String) -> (Bool);

    function new(words: go.Map<String, String>=null, lookupPackage: (name: String) -> (go.Tuple<{ importPath: String, ok: Bool }>)=null, lookupSym: (recv: String, name: String) -> (Bool)=null);

    /**
        Parse parses the doc comment text and returns the *[Doc] form.
        Comment markers (/* // and * /) in the text must have already been removed.
    **/
    @:native("Parse") function parse(text: String): (go.Pointer<go.go.doc.comment.Doc>);

}