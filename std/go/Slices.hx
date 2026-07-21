package go;

@:go.Type({ name: "slices", instanceName: "slices.slices", imports: ["slices"] })
extern class Slices {

    @:native("All") static function all<Slice: Dynamic, E: Dynamic>(s: Slice): (go.iter.Seq2<go.GoInt, E>);
    @:native("AppendSeq") static function appendSeq<Slice: Dynamic, E: Dynamic>(s: Slice, seq: go.iter.Seq<E>): (Slice);
    @:native("Backward") static function backward<Slice: Dynamic, E: Dynamic>(s: Slice): (go.iter.Seq2<go.GoInt, E>);
    @:go.Tuple("p0", "p1") @:native("BinarySearch") static function binarySearch<S: Dynamic, E: go.cmp.Ordered>(x: S, target: E): (go.Tuple<{ p0: go.GoInt, p1: Bool }>);
    @:go.Tuple("p0", "p1") @:native("BinarySearchFunc") static function binarySearchFunc<S: Dynamic, E: Dynamic, T: Dynamic>(x: S, target: T, cmp: (p0: E, p1: T) -> (go.GoInt)): (go.Tuple<{ p0: go.GoInt, p1: Bool }>);
    @:native("Chunk") static function chunk<Slice: Dynamic, E: Dynamic>(s: Slice, n: go.GoInt): (go.iter.Seq<Slice>);
    @:native("Clip") static function clip<S: Dynamic, E: Dynamic>(s: S): (S);
    @:native("Clone") static function clone<S: Dynamic, E: Dynamic>(s: S): (S);
    @:native("Collect") static function collect<E: Dynamic>(seq: go.iter.Seq<E>): (go.Slice<E>);
    @:native("Compact") static function compact<S: Dynamic, E: go.Comparable>(s: S): (S);
    @:native("CompactFunc") static function compactFunc<S: Dynamic, E: Dynamic>(s: S, eq: (p0: E, p1: E) -> (Bool)): (S);
    @:native("Compare") static function compare<S: Dynamic, E: go.cmp.Ordered>(s1: S, s2: S): (go.GoInt);
    @:native("CompareFunc") static function compareFunc<S1: Dynamic, S2: Dynamic, E1: Dynamic, E2: Dynamic>(s1: S1, s2: S2, cmp: (p0: E1, p1: E2) -> (go.GoInt)): (go.GoInt);
    @:native("Concat") static function concat<S: Dynamic, E: Dynamic>(slices: haxe.Rest<S>): (S);
    @:native("Contains") static function contains<S: Dynamic, E: go.Comparable>(s: S, v: E): (Bool);
    @:native("ContainsFunc") static function containsFunc<S: Dynamic, E: Dynamic>(s: S, f: (p0: E) -> (Bool)): (Bool);
    @:native("Delete") static function delete<S: Dynamic, E: Dynamic>(s: S, i: go.GoInt, j: go.GoInt): (S);
    @:native("DeleteFunc") static function deleteFunc<S: Dynamic, E: Dynamic>(s: S, del: (p0: E) -> (Bool)): (S);
    @:native("Equal") static function equal<S: Dynamic, E: go.Comparable>(s1: S, s2: S): (Bool);
    @:native("EqualFunc") static function equalFunc<S1: Dynamic, S2: Dynamic, E1: Dynamic, E2: Dynamic>(s1: S1, s2: S2, eq: (p0: E1, p1: E2) -> (Bool)): (Bool);
    @:native("Grow") static function grow<S: Dynamic, E: Dynamic>(s: S, n: go.GoInt): (S);
    @:native("Index") static function index<S: Dynamic, E: go.Comparable>(s: S, v: E): (go.GoInt);
    @:native("IndexFunc") static function indexFunc<S: Dynamic, E: Dynamic>(s: S, f: (p0: E) -> (Bool)): (go.GoInt);
    @:native("Insert") static function insert<S: Dynamic, E: Dynamic>(s: S, i: go.GoInt, v: haxe.Rest<E>): (S);
    @:native("IsSorted") static function isSorted<S: Dynamic, E: go.cmp.Ordered>(x: S): (Bool);
    @:native("IsSortedFunc") static function isSortedFunc<S: Dynamic, E: Dynamic>(x: S, cmp: (a: E, b: E) -> (go.GoInt)): (Bool);
    @:native("Max") static function max<S: Dynamic, E: go.cmp.Ordered>(x: S): (E);
    @:native("MaxFunc") static function maxFunc<S: Dynamic, E: Dynamic>(x: S, cmp: (a: E, b: E) -> (go.GoInt)): (E);
    @:native("Min") static function min<S: Dynamic, E: go.cmp.Ordered>(x: S): (E);
    @:native("MinFunc") static function minFunc<S: Dynamic, E: Dynamic>(x: S, cmp: (a: E, b: E) -> (go.GoInt)): (E);
    @:native("Repeat") static function repeat<S: Dynamic, E: Dynamic>(x: S, count: go.GoInt): (S);
    @:native("Replace") static function replace<S: Dynamic, E: Dynamic>(s: S, i: go.GoInt, j: go.GoInt, v: haxe.Rest<E>): (S);
    @:native("Reverse") static function reverse<S: Dynamic, E: Dynamic>(s: S): Void;
    @:native("Sort") static function sort<S: Dynamic, E: go.cmp.Ordered>(x: S): Void;
    @:native("SortFunc") static function sortFunc<S: Dynamic, E: Dynamic>(x: S, cmp: (a: E, b: E) -> (go.GoInt)): Void;
    @:native("SortStableFunc") static function sortStableFunc<S: Dynamic, E: Dynamic>(x: S, cmp: (a: E, b: E) -> (go.GoInt)): Void;
    @:native("Sorted") static function sorted<E: go.cmp.Ordered>(seq: go.iter.Seq<E>): (go.Slice<E>);
    @:native("SortedFunc") static function sortedFunc<E: Dynamic>(seq: go.iter.Seq<E>, cmp: (p0: E, p1: E) -> (go.GoInt)): (go.Slice<E>);
    @:native("SortedStableFunc") static function sortedStableFunc<E: Dynamic>(seq: go.iter.Seq<E>, cmp: (p0: E, p1: E) -> (go.GoInt)): (go.Slice<E>);
    @:native("Values") static function values<Slice: Dynamic, E: Dynamic>(s: Slice): (go.iter.Seq<E>);

}