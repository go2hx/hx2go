package go.internal.runtime.atomic;

@:structInit
@:go.Type({ name: "Pointer", instanceName: "atomic.Pointer", imports: ["internal/runtime/atomic"] })
extern class Pointer<T: Dynamic> {

    @:native("CompareAndSwap") function compareAndSwap(old: go.Pointer<T>, _new: go.Pointer<T>): Bool;
    @:native("CompareAndSwapNoWB") function compareAndSwapNoWB(old: go.Pointer<T>, _new: go.Pointer<T>): Bool;
    @:native("Load") function load(): go.Pointer<T>;
    @:native("Store") function store(value: go.Pointer<T>): Void;
    @:native("StoreNoWB") function storeNoWB(value: go.Pointer<T>): Void;

}