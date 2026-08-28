package go.go;

/**
    Package doc extracts source code documentation from a Go AST.
**/
@:go.Type({ name: "doc", instanceName: "doc.doc", imports: ["go/doc"] })
extern class Doc {

    @:native("AllDecls") static var allDecls: go.go.doc.Mode;
    @:native("AllMethods") static var allMethods: go.go.doc.Mode;
    @:native("PreserveAST") static var preserveAST: go.go.doc.Mode;

    /**
        IllegalPrefixes is a list of lower-case prefixes that identify
        a comment as not being a doc comment.
        This helps to avoid misinterpreting the common mistake
        of a copyright notice immediately before a package statement
        as being a doc comment.
    **/
    @:native("IllegalPrefixes") static var illegalPrefixes: go.Slice<String>;

    /**
        Examples returns the examples found in testFiles, sorted by Name field.
        The Order fields record the order in which the examples were encountered.
        The Suffix field is not populated when Examples is called directly, it is
        only populated by [NewFromFiles] for examples it finds in _test.go files.
        
        Playable Examples must be in a package whose name ends in "_test".
        An Example is "playable" (the Play field is non-nil) in either of these
        circumstances:
          - The example function is self-contained: the function references only
            identifiers from other packages (or predeclared identifiers, such as
            "int") and the test file does not include a dot import.
          - The entire test file is the example: the file contains exactly one
            example function, zero test, fuzz test, or benchmark function, and at
            least one top-level function, type, variable, or constant declaration
            other than the example function.
    **/
    @:native("Examples") static function examples(testFiles: haxe.Rest<go.Pointer<go.go.ast.File>>): (go.Slice<go.Pointer<go.go.doc.Example>>);
    /**
        IsPredeclared reports whether s is a predeclared identifier.
    **/
    @:native("IsPredeclared") static function isPredeclared(s: String): (Bool);
    /**
        New computes the package documentation for the given package AST.
        New takes ownership of the AST pkg and may edit or overwrite it.
        To have the [Examples] fields populated, use [NewFromFiles] and include
        the package's _test.go files.
    **/
    @:native("New") static function _new(pkg: go.Pointer<go.go.ast.Package>, importPath: String, mode: go.go.doc.Mode): (go.Pointer<go.go.doc.Package>);
    /**
        NewFromFiles computes documentation for a package.
        
        The package is specified by a list of *ast.Files and corresponding
        file set, which must not be nil.
        
        NewFromFiles uses all provided files when computing documentation,
        so it is the caller's responsibility to provide only the files that
        match the desired build context. "go/build".Context.MatchFile can
        be used for determining whether a file matches a build context with
        the desired GOOS and GOARCH values, and other build constraints.
        The import path of the package is specified by importPath.
        
        Examples found in _test.go files are associated with the corresponding
        type, function, method, or the package, based on their name.
        If the example has a suffix in its name, it is set in the
        [Example.Suffix] field. [Examples] with malformed names are skipped.
        
        Optionally, a single extra argument of type [Mode] can be provided to
        control low-level aspects of the documentation extraction behavior.
        
        NewFromFiles takes ownership of the AST files and may edit them,
        unless the PreserveAST Mode bit is on.
    **/
    @:native("NewFromFiles") static function newFromFiles(fset: go.Pointer<go.go.token.FileSet>, files: go.Slice<go.Pointer<go.go.ast.File>>, importPath: String, opts: haxe.Rest<Dynamic>): (go.Result<go.Pointer<go.go.doc.Package>>);
    /**
        Synopsis returns a cleaned version of the first sentence in text.
        
        Deprecated: New programs should use [Package.Synopsis] instead,
        which handles links in text properly.
    **/
    @:native("Synopsis") static function synopsis(text: String): (String);
    /**
        ToHTML converts comment text to formatted HTML.
        
        Deprecated: ToHTML cannot identify documentation links
        in the doc comment, because they depend on knowing what
        package the text came from, which is not included in this API.
        
        Given the *[doc.Package] p where text was found,
        ToHTML(w, text, nil) can be replaced by:
        
        	w.Write(p.HTML(text))
        
        which is in turn shorthand for:
        
        	w.Write(p.Printer().HTML(p.Parser().Parse(text)))
        
        If words may be non-nil, the longer replacement is:
        
        	parser := p.Parser()
        	parser.Words = words
        	w.Write(p.Printer().HTML(parser.Parse(d)))
    **/
    @:native("ToHTML") static function toHTML(w: go.io.Writer, text: String, words: go.Map<String, String>): Void;
    /**
        ToText converts comment text to formatted text.
        
        Deprecated: ToText cannot identify documentation links
        in the doc comment, because they depend on knowing what
        package the text came from, which is not included in this API.
        
        Given the *[doc.Package] p where text was found,
        ToText(w, text, "", "\t", 80) can be replaced by:
        
        	w.Write(p.Text(text))
        
        In the general case, ToText(w, text, prefix, codePrefix, width)
        can be replaced by:
        
        	d := p.Parser().Parse(text)
        	pr := p.Printer()
        	pr.TextPrefix = prefix
        	pr.TextCodePrefix = codePrefix
        	pr.TextWidth = width
        	w.Write(pr.Text(d))
        
        See the documentation for [Package.Text] and [comment.Printer.Text]
        for more details.
    **/
    @:native("ToText") static function toText(w: go.io.Writer, text: String, prefix: String, codePrefix: String, width: go.GoInt): Void;

}