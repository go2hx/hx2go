package go.iter;

/**
    Seq is an iterator over sequences of individual values.
    When called as seq(yield), seq calls yield(v) for each value v in the sequence,
    stopping early if yield returns false.
    See the [iter] package documentation for more details.
**/
@:go.Type({ name: "Seq", instanceName: "iter.Seq", imports: ["iter"] })
extern class Seq<V: Dynamic> {

}