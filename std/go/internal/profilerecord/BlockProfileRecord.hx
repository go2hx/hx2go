package go.internal.profilerecord;

@:structInit
@:go.Type({ name: "BlockProfileRecord", instanceName: "profilerecord.BlockProfileRecord", imports: ["internal/profilerecord"] })
extern class BlockProfileRecord {

    @:native("Count") var count: go.Int64;
    @:native("Cycles") var cycles: go.Int64;
    @:native("Stack") var stack: go.Slice<go.UIntPtr>;

function new(count: go.Int64, cycles: go.Int64, stack: go.Slice<go.UIntPtr>);

}