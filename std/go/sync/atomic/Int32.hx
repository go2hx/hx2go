package go.sync.atomic;

@:structInit
@:go.Type({ name: "Int32", instanceName: "atomic.Int32", imports: ["sync/atomic"] })
extern class Int32 {

    @:native("Add") function add(delta: go.Int32): (go.Int32);
    @:native("And") function and(mask: go.Int32): (go.Int32);
    @:native("CompareAndSwap") function compareAndSwap(old: go.Int32, _new: go.Int32): (Bool);
    @:native("Load") function load(): (go.Int32);
    @:native("Or") function or(mask: go.Int32): (go.Int32);
    @:native("Store") function store(val: go.Int32): Void;
    @:native("Swap") function swap(_new: go.Int32): (go.Int32);

}