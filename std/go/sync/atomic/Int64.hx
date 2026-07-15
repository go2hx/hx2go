package go.sync.atomic;

@:structInit
@:go.Type({ name: "Int64", instanceName: "atomic.Int64", imports: ["sync/atomic"] })
extern class Int64 {

    @:native("Add") function add(delta: go.Int64): go.Int64;
    @:native("And") function and(mask: go.Int64): go.Int64;
    @:native("CompareAndSwap") function compareAndSwap(old: go.Int64, _new: go.Int64): Bool;
    @:native("Load") function load(): go.Int64;
    @:native("Or") function or(mask: go.Int64): go.Int64;
    @:native("Store") function store(val: go.Int64): Void;
    @:native("Swap") function swap(_new: go.Int64): go.Int64;

}