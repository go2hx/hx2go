package go.go.doc;

/**
    Package comment implements parsing and reformatting of Go doc comments,
    (documentation comments), which are comments that immediately precede
    a top-level declaration of a package, const, func, type, or var.
    
    Go doc comment syntax is a simplified subset of Markdown that supports
    links, headings, paragraphs, lists (without nesting), and preformatted text blocks.
    The details of the syntax are documented at https://go.dev/doc/comment.
    
    To parse the text associated with a doc comment (after removing comment markers),
    use a [Parser]:
    
    	var p comment.Parser
    	doc := p.Parse(text)
    
    The result is a [*Doc].
    To reformat it as a doc comment, HTML, Markdown, or plain text,
    use a [Printer]:
    
    	var pr comment.Printer
    	os.Stdout.Write(pr.Text(doc))
    
    The [Parser] and [Printer] types are structs whose fields can be
    modified to customize the operations.
    For details, see the documentation for those types.
    
    Use cases that need additional control over reformatting can
    implement their own logic by inspecting the parsed syntax itself.
    See the documentation for [Doc], [Block], [Text] for an overview
    and links to additional types.
**/
@:go.Type({ name: "comment", instanceName: "comment.comment", imports: ["go/doc/comment"] })
extern class Comment {

    /**
        DefaultLookupPackage is the default package lookup
        function, used when [Parser.LookupPackage] is nil.
        It recognizes names of the packages from the standard
        library with single-element import paths, such as math,
        which would otherwise be impossible to name.
        
        Note that the go/doc package provides a more sophisticated
        lookup based on the imports used in the current package.
    **/
    @:go.Tuple("importPath", "ok") @:native("DefaultLookupPackage") static function defaultLookupPackage(name: String): (go.Tuple<{ importPath: String, ok: Bool }>);

}