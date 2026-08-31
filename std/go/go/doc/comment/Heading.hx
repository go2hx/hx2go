package go.go.doc.comment;

/**
    A Heading is a doc comment heading.
**/
@:structInit
@:go.Type({ name: "Heading", instanceName: "comment.Heading", imports: ["go/doc/comment"] })
extern class Heading {

    @:native("Text") var text: go.Slice<go.go.doc.comment.Text>;

    function new(text: go.Slice<go.go.doc.comment.Text>=null);

    /**
        DefaultID returns the default anchor ID for the heading h.
        
        The default anchor ID is constructed by converting every
        rune that is not alphanumeric ASCII to an underscore
        and then adding the prefix “hdr-”.
        For example, if the heading text is “Go Doc Comments”,
        the default ID is “hdr-Go_Doc_Comments”.
    **/
    @:native("DefaultID") function defaultID(): (String);

}