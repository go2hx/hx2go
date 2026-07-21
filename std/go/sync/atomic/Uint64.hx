package go.sync.atomic;

@:structInit
@:go.Type({ name: "Uint64", instanceName: "atomic.Uint64", imports: ["sync/atomic"] })
extern class Uint64 {

    @:native("Add") function add(delta: go.UInt64): (go.UInt64);
    @:native("And") function and(mask: go.UInt64): (go.UInt64);
    @:native("CompareAndSwap") function compareAndSwap(old: go.UInt64, _new: go.UInt64): (Bool);
    @:native("Load") function load(): (go.UInt64);
    @:native("Or") function or(mask: go.UInt64): (go.UInt64);
    @:native("Store") function store(val: go.UInt64): Void;
    @:native("Swap") function swap(_new: go.UInt64): (go.UInt64);

}