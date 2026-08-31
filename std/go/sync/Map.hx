package go.sync;

/**
    Map is like a Go map[any]any but is safe for concurrent use
    by multiple goroutines without additional locking or coordination.
    Loads, stores, and deletes run in amortized constant time.
    
    The Map type is specialized. Most code should use a plain Go map instead,
    with separate locking or coordination, for better type safety and to make it
    easier to maintain other invariants along with the map content.
    
    The Map type is optimized for two common use cases: (1) when the entry for a given
    key is only ever written once but read many times, as in caches that only grow,
    or (2) when multiple goroutines read, write, and overwrite entries for disjoint
    sets of keys. In these two cases, use of a Map may significantly reduce lock
    contention compared to a Go map paired with a separate [Mutex] or [RWMutex].
    
    The zero Map is empty and ready for use. A Map must not be copied after first use.
    
    In the terminology of [the Go memory model], Map arranges that a write operation
    “synchronizes before” any read operation that observes the effect of the write, where
    read and write operations are defined as follows.
    [Map.Load], [Map.LoadAndDelete], [Map.LoadOrStore], [Map.Swap], [Map.CompareAndSwap],
    and [Map.CompareAndDelete] are read operations;
    [Map.Delete], [Map.LoadAndDelete], [Map.Store], and [Map.Swap] are write operations;
    [Map.LoadOrStore] is a write operation when it returns loaded set to false;
    [Map.CompareAndSwap] is a write operation when it returns swapped set to true;
    and [Map.CompareAndDelete] is a write operation when it returns deleted set to true.
    
    [the Go memory model]: https://go.dev/ref/mem
**/
@:structInit
@:go.Type({ name: "Map", instanceName: "sync.Map", imports: ["sync"] })
extern class Map {

    /**
        Clear deletes all the entries, resulting in an empty Map.
    **/
    @:native("Clear") function clear(): Void;
    /**
        CompareAndDelete deletes the entry for key if its value is equal to old.
        The old value must be of a comparable type.
        
        If there is no current value for key in the map, CompareAndDelete
        returns false (even if the old value is the nil interface value).
    **/
    @:native("CompareAndDelete") function compareAndDelete(key: Dynamic, old: Dynamic): (Bool);
    /**
        CompareAndSwap swaps the old and new values for key
        if the value stored in the map is equal to old.
        The old value must be of a comparable type.
    **/
    @:native("CompareAndSwap") function compareAndSwap(key: Dynamic, old: Dynamic, _new: Dynamic): (Bool);
    /**
        Delete deletes the value for a key.
        If the key is not in the map, Delete does nothing.
    **/
    @:native("Delete") function delete(key: Dynamic): Void;
    /**
        Load returns the value stored in the map for a key, or nil if no
        value is present.
        The ok result indicates whether value was found in the map.
    **/
    @:go.Tuple("value", "ok") @:native("Load") function load(key: Dynamic): (go.Tuple<{ value: Dynamic, ok: Bool }>);
    /**
        LoadAndDelete deletes the value for a key, returning the previous value if any.
        The loaded result reports whether the key was present.
    **/
    @:go.Tuple("value", "loaded") @:native("LoadAndDelete") function loadAndDelete(key: Dynamic): (go.Tuple<{ value: Dynamic, loaded: Bool }>);
    /**
        LoadOrStore returns the existing value for the key if present.
        Otherwise, it stores and returns the given value.
        The loaded result is true if the value was loaded, false if stored.
    **/
    @:go.Tuple("actual", "loaded") @:native("LoadOrStore") function loadOrStore(key: Dynamic, value: Dynamic): (go.Tuple<{ actual: Dynamic, loaded: Bool }>);
    /**
        Range calls f sequentially for each key and value present in the map.
        If f returns false, range stops the iteration.
        
        Range does not necessarily correspond to any consistent snapshot of the Map's
        contents: no key will be visited more than once, but if the value for any key
        is stored or deleted concurrently (including by f), Range may reflect any
        mapping for that key from any point during the Range call. Range does not
        block other methods on the receiver; even f itself may call any method on m.
        
        Range may be O(N) with the number of elements in the map even if f returns
        false after a constant number of calls.
    **/
    @:native("Range") function range(f: (key: Dynamic, value: Dynamic) -> (Bool)): Void;
    /**
        Store sets the value for a key.
    **/
    @:native("Store") function store(key: Dynamic, value: Dynamic): Void;
    /**
        Swap swaps the value for a key and returns the previous value if any.
        The loaded result reports whether the key was present.
    **/
    @:go.Tuple("previous", "loaded") @:native("Swap") function swap(key: Dynamic, value: Dynamic): (go.Tuple<{ previous: Dynamic, loaded: Bool }>);

}