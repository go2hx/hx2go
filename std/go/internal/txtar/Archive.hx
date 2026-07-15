package go.internal.txtar;

@:structInit
@:go.Type({ name: "Archive", instanceName: "txtar.Archive", imports: ["internal/txtar"] })
extern class Archive {

    @:native("Comment") var comment: go.Slice<go.Byte>;
    @:native("Files") var files: go.Slice<go.internal.txtar.File>;

function new(comment: go.Slice<go.Byte>, files: go.Slice<go.internal.txtar.File>);

}