package go.sync.atomic;

@:structInit
@:go.Type({ name: "Bool", instanceName: "atomic.Bool", imports: ["sync/atomic"] })
extern class Bool {

    @:native("CompareAndSwap") function compareAndSwap(old: Bool, _new: Bool): Bool;
    @:native("Load") function load(): Bool;
    @:native("Store") function store(val: Bool): Void;
    @:native("Swap") function swap(_new: Bool): Bool;

}