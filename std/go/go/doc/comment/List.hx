package go.go.doc.comment;

@:structInit
@:go.Type({ name: "List", instanceName: "comment.List", imports: ["go/doc/comment"] })
extern class List {

    @:native("Items") var items: go.Slice<go.Pointer<go.go.doc.comment.ListItem>>;
    @:native("ForceBlankBefore") var forceBlankBefore: Bool;
    @:native("ForceBlankBetween") var forceBlankBetween: Bool;

    function new(items: go.Slice<go.Pointer<go.go.doc.comment.ListItem>>, forceBlankBefore: Bool, forceBlankBetween: Bool);

    @:native("BlankBefore") function blankBefore(): (Bool);
    @:native("BlankBetween") function blankBetween(): (Bool);

}