package go.internal.runtime.atomic;

@:structInit
@:go.Type({ name: "Uintptr", instanceName: "atomic.Uintptr", imports: ["internal/runtime/atomic"] })
extern class Uintptr {

    @:native("Add") function add(delta: go.UIntPtr): go.UIntPtr;
    @:native("CompareAndSwap") function compareAndSwap(old: go.UIntPtr, _new: go.UIntPtr): Bool;
    @:native("Load") function load(): go.UIntPtr;
    @:native("LoadAcquire") function loadAcquire(): go.UIntPtr;
    @:native("Store") function store(value: go.UIntPtr): Void;
    @:native("StoreRelease") function storeRelease(value: go.UIntPtr): Void;
    @:native("Swap") function swap(value: go.UIntPtr): go.UIntPtr;

}