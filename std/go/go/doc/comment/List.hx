package go.go.doc.comment;

/**
    A List is a numbered or bullet list.
    Lists are always non-empty: len(Items) > 0.
    In a numbered list, every Items[i].Number is a non-empty string.
    In a bullet list, every Items[i].Number is an empty string.
**/
@:structInit
@:go.Type({ name: "List", instanceName: "comment.List", imports: ["go/doc/comment"] })
extern class List {

    @:native("Items") var items: go.Slice<go.Pointer<go.go.doc.comment.ListItem>>;
    @:native("ForceBlankBefore") var forceBlankBefore: Bool;
    @:native("ForceBlankBetween") var forceBlankBetween: Bool;

    function new(items: go.Slice<go.Pointer<go.go.doc.comment.ListItem>>=null, forceBlankBefore: Bool=false, forceBlankBetween: Bool=false);

    /**
        BlankBefore reports whether a reformatting of the comment
        should include a blank line before the list.
        The default rule is the same as for [BlankBetween]:
        if the list item content contains any blank lines
        (meaning at least one item has multiple paragraphs)
        then the list itself must be preceded by a blank line.
        A preceding blank line can be forced by setting [List].ForceBlankBefore.
    **/
    @:native("BlankBefore") function blankBefore(): (Bool);
    /**
        BlankBetween reports whether a reformatting of the comment
        should include a blank line between each pair of list items.
        The default rule is that if the list item content contains any blank lines
        (meaning at least one item has multiple paragraphs)
        then list items must themselves be separated by blank lines.
        Blank line separators can be forced by setting [List].ForceBlankBetween.
    **/
    @:native("BlankBetween") function blankBetween(): (Bool);

}