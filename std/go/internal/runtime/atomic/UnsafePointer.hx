package go.internal.runtime.atomic;

@:structInit
@:go.Type({ name: "UnsafePointer", instanceName: "atomic.UnsafePointer", imports: ["internal/runtime/atomic"] })
extern class UnsafePointer {

    @:native("CompareAndSwap") function compareAndSwap(old: go.unsafe.Pointer, _new: go.unsafe.Pointer): Bool;
    @:native("CompareAndSwapNoWB") function compareAndSwapNoWB(old: go.unsafe.Pointer, _new: go.unsafe.Pointer): Bool;
    @:native("Load") function load(): go.unsafe.Pointer;
    @:native("Store") function store(value: go.unsafe.Pointer): Void;
    @:native("StoreNoWB") function storeNoWB(value: go.unsafe.Pointer): Void;

}