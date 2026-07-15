package go.sync;

@:structInit
@:go.Type({ name: "Map", instanceName: "sync.Map", imports: ["sync"] })
extern class Map {

    @:native("Clear") function clear(): Void;
    @:native("CompareAndDelete") function compareAndDelete(key: Dynamic, old: Dynamic): Bool;
    @:native("CompareAndSwap") function compareAndSwap(key: Dynamic, old: Dynamic, _new: Dynamic): Bool;
    @:native("Delete") function delete(key: Dynamic): Void;
    @:go.Tuple("value", "ok") @:native("Load") function load(key: Dynamic): go.Tuple<{ value: Dynamic, ok: Bool }>;
    @:go.Tuple("value", "loaded") @:native("LoadAndDelete") function loadAndDelete(key: Dynamic): go.Tuple<{ value: Dynamic, loaded: Bool }>;
    @:go.Tuple("actual", "loaded") @:native("LoadOrStore") function loadOrStore(key: Dynamic, value: Dynamic): go.Tuple<{ actual: Dynamic, loaded: Bool }>;
    @:native("Range") function range(f: (key: Dynamic, value: Dynamic) -> Bool): Void;
    @:native("Store") function store(key: Dynamic, value: Dynamic): Void;
    @:go.Tuple("previous", "loaded") @:native("Swap") function swap(key: Dynamic, value: Dynamic): go.Tuple<{ previous: Dynamic, loaded: Bool }>;

}