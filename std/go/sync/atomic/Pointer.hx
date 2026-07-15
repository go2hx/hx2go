package go.sync.atomic;

@:structInit
@:go.Type({ name: "Pointer", instanceName: "atomic.Pointer", imports: ["sync/atomic"] })
extern class Pointer<T: Dynamic> {

    @:native("CompareAndSwap") function compareAndSwap(old: go.Pointer<T>, _new: go.Pointer<T>): Bool;
    @:native("Load") function load(): go.Pointer<T>;
    @:native("Store") function store(val: go.Pointer<T>): Void;
    @:native("Swap") function swap(_new: go.Pointer<T>): go.Pointer<T>;

}