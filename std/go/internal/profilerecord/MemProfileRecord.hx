package go.internal.profilerecord;

@:structInit
@:go.Type({ name: "MemProfileRecord", instanceName: "profilerecord.MemProfileRecord", imports: ["internal/profilerecord"] })
extern class MemProfileRecord {

    @:native("AllocBytes") var allocBytes: go.Int64;
    @:native("FreeBytes") var freeBytes: go.Int64;
    @:native("AllocObjects") var allocObjects: go.Int64;
    @:native("FreeObjects") var freeObjects: go.Int64;
    @:native("Stack") var stack: go.Slice<go.UIntPtr>;

function new(allocBytes: go.Int64, freeBytes: go.Int64, allocObjects: go.Int64, freeObjects: go.Int64, stack: go.Slice<go.UIntPtr>);

    @:native("InUseBytes") function inUseBytes(): go.Int64;
    @:native("InUseObjects") function inUseObjects(): go.Int64;

}