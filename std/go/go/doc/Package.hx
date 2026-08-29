package go.go.doc;

/**
    Package is the documentation for an entire package.
**/
@:structInit
@:go.Type({ name: "Package", instanceName: "doc.Package", imports: ["go/doc"] })
extern class Package {

    @:native("Doc") var doc: String;
    @:native("Name") var name: String;
    @:native("ImportPath") var importPath: String;
    @:native("Imports") var imports: go.Slice<String>;
    @:native("Filenames") var filenames: go.Slice<String>;
    @:native("Notes") var notes: go.Map<String, go.Slice<go.Pointer<go.go.doc.Note>>>;
    @:native("Bugs") var bugs: go.Slice<String>;
    @:native("Consts") var consts: go.Slice<go.Pointer<go.go.doc.Value>>;
    @:native("Types") var types: go.Slice<go.Pointer<go.go.doc.Type>>;
    @:native("Vars") var vars: go.Slice<go.Pointer<go.go.doc.Value>>;
    @:native("Funcs") var funcs: go.Slice<go.Pointer<go.go.doc.Func>>;
    @:native("Examples") var examples: go.Slice<go.Pointer<go.go.doc.Example>>;

    function new(doc: String="", name: String="", importPath: String="", imports: go.Slice<String>=null, filenames: go.Slice<String>=null, notes: go.Map<String, go.Slice<go.Pointer<go.go.doc.Note>>>=null, bugs: go.Slice<String>=null, consts: go.Slice<go.Pointer<go.go.doc.Value>>=null, types: go.Slice<go.Pointer<go.go.doc.Type>>=null, vars: go.Slice<go.Pointer<go.go.doc.Value>>=null, funcs: go.Slice<go.Pointer<go.go.doc.Func>>=null, examples: go.Slice<go.Pointer<go.go.doc.Example>>=null);

    /**
        Filter eliminates documentation for names that don't pass through the filter f.
        TODO(gri): Recognize "Type.Method" as a name.
    **/
    @:native("Filter") function filter(f: go.go.doc.Filter): Void;
    /**
        HTML returns formatted HTML for the doc comment text.
        
        To customize details of the HTML, use [Package.Printer]
        to obtain a [comment.Printer], and configure it
        before calling its HTML method.
    **/
    @:native("HTML") function HTML(text: String): (go.Slice<go.Byte>);
    /**
        Markdown returns formatted Markdown for the doc comment text.
        
        To customize details of the Markdown, use [Package.Printer]
        to obtain a [comment.Printer], and configure it
        before calling its Markdown method.
    **/
    @:native("Markdown") function markdown(text: String): (go.Slice<go.Byte>);
    /**
        Parser returns a doc comment parser configured
        for parsing doc comments from package p.
        Each call returns a new parser, so that the caller may
        customize it before use.
    **/
    @:native("Parser") function parser(): (go.Pointer<go.go.doc.comment.Parser>);
    /**
        Printer returns a doc comment printer configured
        for printing doc comments from package p.
        Each call returns a new printer, so that the caller may
        customize it before use.
    **/
    @:native("Printer") function printer(): (go.Pointer<go.go.doc.comment.Printer>);
    /**
        Synopsis returns a cleaned version of the first sentence in text.
        That sentence ends after the first period followed by space and not
        preceded by exactly one uppercase letter, or at the first paragraph break.
        The result string has no \n, \r, or \t characters and uses only single
        spaces between words. If text starts with any of the [IllegalPrefixes],
        the result is the empty string.
    **/
    @:native("Synopsis") function synopsis(text: String): (String);
    /**
        Text returns formatted text for the doc comment text,
        wrapped to 80 Unicode code points and using tabs for
        code block indentation.
        
        To customize details of the formatting, use [Package.Printer]
        to obtain a [comment.Printer], and configure it
        before calling its Text method.
    **/
    @:native("Text") function text(text: String): (go.Slice<go.Byte>);

}