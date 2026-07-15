package go;

@:go.Type({ name: "iter", instanceName: "iter.iter", imports: ["iter"] })
extern class Iter {

    @:go.Tuple("next", "stop") @:native("Pull") static function pull<V: Dynamic>(seq: go.iter.Seq<V>): go.Tuple<{ next: () -> go.Tuple<{ p0: V, p1: Bool }>, stop: () -> Void }>;
    @:go.Tuple("next", "stop") @:native("Pull2") static function pull2<K: Dynamic, V: Dynamic>(seq: go.iter.Seq2<K, V>): go.Tuple<{ next: () -> go.Tuple<{ p0: K, p1: V, p2: Bool }>, stop: () -> Void }>;

}