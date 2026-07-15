package go.sync.atomic;

@:structInit
@:go.Type({ name: "Value", instanceName: "atomic.Value", imports: ["sync/atomic"] })
extern class Value {

    @:native("CompareAndSwap") function compareAndSwap(old: Dynamic, _new: Dynamic): Bool;
    @:native("Load") function load(): Dynamic;
    @:native("Store") function store(val: Dynamic): Void;
    @:native("Swap") function swap(_new: Dynamic): Dynamic;

}