package go;

@:go.Type({ name: "sort", instanceName: "sort.sort", imports: ["sort"] })
extern class Sort {

    @:go.Tuple("i", "found") @:native("Find") static function find(n: go.GoInt, cmp: (p0: go.GoInt) -> (go.GoInt)): (go.Tuple<{ i: go.GoInt, found: Bool }>);
    @:native("Float64s") static function float64s(x: go.Slice<Float>): Void;
    @:native("Float64sAreSorted") static function float64sAreSorted(x: go.Slice<Float>): (Bool);
    @:native("Ints") static function ints(x: go.Slice<go.GoInt>): Void;
    @:native("IntsAreSorted") static function intsAreSorted(x: go.Slice<go.GoInt>): (Bool);
    @:native("IsSorted") static function isSorted(data: go.sort.Interface): (Bool);
    @:native("Reverse") static function reverse(data: go.sort.Interface): (go.sort.Interface);
    @:native("Search") static function search(n: go.GoInt, f: (p0: go.GoInt) -> (Bool)): (go.GoInt);
    @:native("SearchFloat64s") static function searchFloat64s(a: go.Slice<Float>, x: Float): (go.GoInt);
    @:native("SearchInts") static function searchInts(a: go.Slice<go.GoInt>, x: go.GoInt): (go.GoInt);
    @:native("SearchStrings") static function searchStrings(a: go.Slice<String>, x: String): (go.GoInt);
    @:native("Slice") static function slice(x: Dynamic, less: (i: go.GoInt, j: go.GoInt) -> (Bool)): Void;
    @:native("SliceIsSorted") static function sliceIsSorted(x: Dynamic, less: (i: go.GoInt, j: go.GoInt) -> (Bool)): (Bool);
    @:native("SliceStable") static function sliceStable(x: Dynamic, less: (i: go.GoInt, j: go.GoInt) -> (Bool)): Void;
    @:native("Sort") static function sort(data: go.sort.Interface): Void;
    @:native("Stable") static function stable(data: go.sort.Interface): Void;
    @:native("Strings") static function strings(x: go.Slice<String>): Void;
    @:native("StringsAreSorted") static function stringsAreSorted(x: go.Slice<String>): (Bool);

}