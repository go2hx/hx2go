package go.internal.sync;

@:structInit
@:go.Type({ name: "HashTrieMap", instanceName: "sync.HashTrieMap", imports: ["internal/sync"] })
extern class HashTrieMap<K: go.Comparable, V: Dynamic> {

    @:native("All") function all(): func(yield func(K, V) bool);
    @:native("Clear") function clear(): Void;
    @:native("CompareAndDelete") function compareAndDelete(key: K, old: V): Bool;
    @:native("CompareAndSwap") function compareAndSwap(key: K, old: V, _new: V): Bool;
    @:native("Delete") function delete(key: K): Void;
    @:go.Tuple("value", "ok") @:native("Load") function load(key: K): go.Tuple<{ value: V, ok: Bool }>;
    @:go.Tuple("value", "loaded") @:native("LoadAndDelete") function loadAndDelete(key: K): go.Tuple<{ value: V, loaded: Bool }>;
    @:go.Tuple("result", "loaded") @:native("LoadOrStore") function loadOrStore(key: K, value: V): go.Tuple<{ result: V, loaded: Bool }>;
    @:native("Range") function range(yield: (p0: K, p1: V) -> Bool): Void;
    @:native("Store") function store(key: K, _new: V): Void;
    @:go.Tuple("previous", "loaded") @:native("Swap") function swap(key: K, _new: V): go.Tuple<{ previous: V, loaded: Bool }>;

}