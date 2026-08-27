package go.go.doc.comment;

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

    @:native("Comment") function comment(d: go.Pointer<go.go.doc.comment.Doc>): (go.Slice<go.Byte>);
    @:native("HTML") function HTML(d: go.Pointer<go.go.doc.comment.Doc>): (go.Slice<go.Byte>);
    @:native("Markdown") function markdown(d: go.Pointer<go.go.doc.comment.Doc>): (go.Slice<go.Byte>);
    @:native("Text") function text(d: go.Pointer<go.go.doc.comment.Doc>): (go.Slice<go.Byte>);

}