package go.runtime;

@:structInit
@:go.Type({ name: "MemProfileRecord", instanceName: "runtime.MemProfileRecord", imports: ["runtime"] })
extern class MemProfileRecord {

    @:native("AllocBytes") var allocBytes: go.Int64;
    @:native("FreeBytes") var freeBytes: go.Int64;
    @:native("AllocObjects") var allocObjects: go.Int64;
    @:native("FreeObjects") var freeObjects: go.Int64;
    @:native("Stack0") var stack0: go.GoArray<go.UIntPtr, 32>;

    function new(allocBytes: go.Int64=0, freeBytes: go.Int64=0, allocObjects: go.Int64=0, freeObjects: go.Int64=0, stack0: go.GoArray<go.UIntPtr, 32>);

    @:native("InUseBytes") function inUseBytes(): (go.Int64);
    @:native("InUseObjects") function inUseObjects(): (go.Int64);
    @:native("Stack") function stack(): (go.Slice<go.UIntPtr>);

}