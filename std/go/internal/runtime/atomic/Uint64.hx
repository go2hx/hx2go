package go.internal.runtime.atomic;

@:structInit
@:go.Type({ name: "Uint64", instanceName: "atomic.Uint64", imports: ["internal/runtime/atomic"] })
extern class Uint64 {

    @:native("Add") function add(delta: go.Int64): go.UInt64;
    @:native("CompareAndSwap") function compareAndSwap(old: go.UInt64, _new: go.UInt64): Bool;
    @:native("Load") function load(): go.UInt64;
    @:native("LoadAcquire") function loadAcquire(): go.UInt64;
    @:native("Store") function store(value: go.UInt64): Void;
    @:native("StoreRelease") function storeRelease(value: go.UInt64): Void;
    @:native("Swap") function swap(value: go.UInt64): go.UInt64;

}