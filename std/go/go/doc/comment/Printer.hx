package go.go.doc.comment;

/**
    A Printer is a doc comment printer.
    The fields in the struct can be filled in before calling
    any of the printing methods
    in order to customize the details of the printing process.
**/
@:structInit
@:go.Type({ name: "Printer", instanceName: "comment.Printer", imports: ["go/doc/comment"] })
extern class Printer {

    @:native("HeadingLevel") var headingLevel: go.GoInt;
    @:native("HeadingID") var headingID: (h: go.Pointer<go.go.doc.comment.Heading>) -> (String);
    @:native("DocLinkURL") var docLinkURL: (link: go.Pointer<go.go.doc.comment.DocLink>) -> (String);
    @:native("DocLinkBaseURL") var docLinkBaseURL: String;
    @:native("TextPrefix") var textPrefix: String;
    @:native("TextCodePrefix") var textCodePrefix: String;
    @:native("TextWidth") var textWidth: go.GoInt;

    function new(headingLevel: go.GoInt=0, headingID: (h: go.Pointer<go.go.doc.comment.Heading>) -> (String)=null, docLinkURL: (link: go.Pointer<go.go.doc.comment.DocLink>) -> (String)=null, docLinkBaseURL: String="", textPrefix: String="", textCodePrefix: String="", textWidth: go.GoInt=0);

    /**
        Comment returns the standard Go formatting of the [Doc],
        without any comment markers.
    **/
    @:native("Comment") function comment(d: go.Pointer<go.go.doc.comment.Doc>): (go.Slice<go.Byte>);
    /**
        HTML returns an HTML formatting of the [Doc].
        See the [Printer] documentation for ways to customize the HTML output.
    **/
    @:native("HTML") function HTML(d: go.Pointer<go.go.doc.comment.Doc>): (go.Slice<go.Byte>);
    /**
        Markdown returns a Markdown formatting of the Doc.
        See the [Printer] documentation for ways to customize the Markdown output.
    **/
    @:native("Markdown") function markdown(d: go.Pointer<go.go.doc.comment.Doc>): (go.Slice<go.Byte>);
    /**
        Text returns a textual formatting of the [Doc].
        See the [Printer] documentation for ways to customize the text output.
    **/
    @:native("Text") function text(d: go.Pointer<go.go.doc.comment.Doc>): (go.Slice<go.Byte>);

}