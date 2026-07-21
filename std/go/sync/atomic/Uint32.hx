package go.sync.atomic;

@:structInit
@:go.Type({ name: "Uint32", instanceName: "atomic.Uint32", imports: ["sync/atomic"] })
extern class Uint32 {

    @:native("Add") function add(delta: go.UInt32): (go.UInt32);
    @:native("And") function and(mask: go.UInt32): (go.UInt32);
    @:native("CompareAndSwap") function compareAndSwap(old: go.UInt32, _new: go.UInt32): (Bool);
    @:native("Load") function load(): (go.UInt32);
    @:native("Or") function or(mask: go.UInt32): (go.UInt32);
    @:native("Store") function store(val: go.UInt32): Void;
    @:native("Swap") function swap(_new: go.UInt32): (go.UInt32);

}