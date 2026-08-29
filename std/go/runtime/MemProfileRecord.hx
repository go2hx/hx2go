package go.runtime;

/**
    A MemProfileRecord describes the live objects allocated
    by a particular call sequence (stack trace).
**/
@:structInit
@:go.Type({ name: "MemProfileRecord", instanceName: "runtime.MemProfileRecord", imports: ["runtime"] })
extern class MemProfileRecord {

    @:native("AllocBytes") var allocBytes: go.Int64;
    @:native("FreeBytes") var freeBytes: go.Int64;
    @:native("AllocObjects") var allocObjects: go.Int64;
    @:native("FreeObjects") var freeObjects: go.Int64;
    @:native("Stack0") var stack0: go.GoArray<go.UIntPtr, 32>;

    function new(allocBytes: go.Int64=0, freeBytes: go.Int64=0, allocObjects: go.Int64=0, freeObjects: go.Int64=0, stack0: go.GoArray<go.UIntPtr, 32>);

    /**
        InUseBytes returns the number of bytes in use (AllocBytes - FreeBytes).
    **/
    @:native("InUseBytes") function inUseBytes(): (go.Int64);
    /**
        InUseObjects returns the number of objects in use (AllocObjects - FreeObjects).
    **/
    @:native("InUseObjects") function inUseObjects(): (go.Int64);
    /**
        Stack returns the stack trace associated with the record,
        a prefix of r.Stack0.
    **/
    @:native("Stack") function stack(): (go.Slice<go.UIntPtr>);

}