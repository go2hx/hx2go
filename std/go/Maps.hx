package go;

@:go.Type({ name: "maps", instanceName: "maps.maps", imports: ["maps"] })
extern class Maps {

    @:native("All") static function all<Map: Dynamic, K: go.Comparable, V: Dynamic>(m: Map): go.iter.Seq2<K, V>;
    @:native("Clone") static function clone<M: Dynamic, K: go.Comparable, V: Dynamic>(m: M): M;
    @:native("Collect") static function collect<K: go.Comparable, V: Dynamic>(seq: go.iter.Seq2<K, V>): go.Map<K, V>;
    @:native("Copy") static function copy<M1: Dynamic, M2: Dynamic, K: go.Comparable, V: Dynamic>(dst: M1, src: M2): Void;
    @:native("DeleteFunc") static function deleteFunc<M: Dynamic, K: go.Comparable, V: Dynamic>(m: M, del: (p0: K, p1: V) -> Bool): Void;
    @:native("Equal") static function equal<M1: Dynamic, M2: Dynamic, K: go.Comparable, V: go.Comparable>(m1: M1, m2: M2): Bool;
    @:native("EqualFunc") static function equalFunc<M1: Dynamic, M2: Dynamic, K: go.Comparable, V1: Dynamic, V2: Dynamic>(m1: M1, m2: M2, eq: (p0: V1, p1: V2) -> Bool): Bool;
    @:native("Insert") static function insert<Map: Dynamic, K: go.Comparable, V: Dynamic>(m: Map, seq: go.iter.Seq2<K, V>): Void;
    @:native("Keys") static function keys<Map: Dynamic, K: go.Comparable, V: Dynamic>(m: Map): go.iter.Seq<K>;
    @:native("Values") static function values<Map: Dynamic, K: go.Comparable, V: Dynamic>(m: Map): go.iter.Seq<V>;

}