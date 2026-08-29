package go.iter;

/**
    Seq2 is an iterator over sequences of pairs of values, most commonly key-value pairs.
    When called as seq(yield), seq calls yield(k, v) for each pair (k, v) in the sequence,
    stopping early if yield returns false.
    See the [iter] package documentation for more details.
**/
@:go.Type({ name: "Seq2", instanceName: "iter.Seq2", imports: ["iter"] })
extern class Seq2<K: Dynamic, V: Dynamic> {

}