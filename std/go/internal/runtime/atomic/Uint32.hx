package go.internal.runtime.atomic;

@:structInit
@:go.Type({ name: "Uint32", instanceName: "atomic.Uint32", imports: ["internal/runtime/atomic"] })
extern class Uint32 {

    @:native("Add") function add(delta: go.Int32): go.UInt32;
    @:native("And") function and(value: go.UInt32): Void;
    @:native("CompareAndSwap") function compareAndSwap(old: go.UInt32, _new: go.UInt32): Bool;
    @:native("CompareAndSwapRelease") function compareAndSwapRelease(old: go.UInt32, _new: go.UInt32): Bool;
    @:native("Load") function load(): go.UInt32;
    @:native("LoadAcquire") function loadAcquire(): go.UInt32;
    @:native("Or") function or(value: go.UInt32): Void;
    @:native("Store") function store(value: go.UInt32): Void;
    @:native("StoreRelease") function storeRelease(value: go.UInt32): Void;
    @:native("Swap") function swap(value: go.UInt32): go.UInt32;

}