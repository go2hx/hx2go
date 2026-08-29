package go;

/**
    Package maps defines various functions useful with maps of any type.
    
    This package does not have any special handling for non-reflexive keys
    (keys k where k != k), such as floating-point NaNs.
**/
@:go.Type({ name: "maps", instanceName: "maps.maps", imports: ["maps"] })
extern class Maps {

    /**
        All returns an iterator over key-value pairs from m.
        The iteration order is not specified and is not guaranteed
        to be the same from one call to the next.
    **/
    @:native("All") static function all<Map: Dynamic, K: go.Comparable, V: Dynamic>(m: Map): (go.iter.Seq2<K, V>);
    /**
        Clone returns a copy of m.  This is a shallow clone:
        the new keys and values are set using ordinary assignment.
    **/
    @:native("Clone") static function clone<M: Dynamic, K: go.Comparable, V: Dynamic>(m: M): (M);
    /**
        Collect collects key-value pairs from seq into a new map
        and returns it.
    **/
    @:native("Collect") static function collect<K: go.Comparable, V: Dynamic>(seq: go.iter.Seq2<K, V>): (go.Map<K, V>);
    /**
        Copy copies all key/value pairs in src adding them to dst.
        When a key in src is already present in dst,
        the value in dst will be overwritten by the value associated
        with the key in src.
    **/
    @:native("Copy") static function copy<M1: Dynamic, M2: Dynamic, K: go.Comparable, V: Dynamic>(dst: M1, src: M2): Void;
    /**
        DeleteFunc deletes any key/value pairs from m for which del returns true.
    **/
    @:native("DeleteFunc") static function deleteFunc<M: Dynamic, K: go.Comparable, V: Dynamic>(m: M, del: (p0: K, p1: V) -> (Bool)): Void;
    /**
        Equal reports whether two maps contain the same key/value pairs.
        Values are compared using ==.
    **/
    @:native("Equal") static function equal<M1: Dynamic, M2: Dynamic, K: go.Comparable, V: go.Comparable>(m1: M1, m2: M2): (Bool);
    /**
        EqualFunc is like Equal, but compares values using eq.
        Keys are still compared with ==.
    **/
    @:native("EqualFunc") static function equalFunc<M1: Dynamic, M2: Dynamic, K: go.Comparable, V1: Dynamic, V2: Dynamic>(m1: M1, m2: M2, eq: (p0: V1, p1: V2) -> (Bool)): (Bool);
    /**
        Insert adds the key-value pairs from seq to m.
        If a key in seq already exists in m, its value will be overwritten.
    **/
    @:native("Insert") static function insert<Map: Dynamic, K: go.Comparable, V: Dynamic>(m: Map, seq: go.iter.Seq2<K, V>): Void;
    /**
        Keys returns an iterator over keys in m.
        The iteration order is not specified and is not guaranteed
        to be the same from one call to the next.
    **/
    @:native("Keys") static function keys<Map: Dynamic, K: go.Comparable, V: Dynamic>(m: Map): (go.iter.Seq<K>);
    /**
        Values returns an iterator over values in m.
        The iteration order is not specified and is not guaranteed
        to be the same from one call to the next.
    **/
    @:native("Values") static function values<Map: Dynamic, K: go.Comparable, V: Dynamic>(m: Map): (go.iter.Seq<V>);

}