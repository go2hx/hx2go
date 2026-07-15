package go.internal;

@:go.Type({ name: "diff", instanceName: "diff.diff", imports: ["internal/diff"] })
extern class Diff {

    @:native("Diff") static function diff(oldName: String, old: go.Slice<go.Byte>, newName: String, _new: go.Slice<go.Byte>): go.Slice<go.Byte>;

}