package go.unicode;

/**
    RangeTable defines a set of Unicode code points by listing the ranges of
    code points within the set. The ranges are listed in two slices
    to save space: a slice of 16-bit ranges and a slice of 32-bit ranges.
    The two slices must be in sorted order and non-overlapping.
    Also, R32 should contain only values >= 0x10000 (1<<16).
**/
@:structInit
@:go.Type({ name: "RangeTable", instanceName: "unicode.RangeTable", imports: ["unicode"] })
extern class RangeTable {

    @:native("R16") var R16: go.Slice<go.unicode.Range16>;
    @:native("R32") var R32: go.Slice<go.unicode.Range32>;
    @:native("LatinOffset") var latinOffset: go.GoInt;

    function new(R16: go.Slice<go.unicode.Range16>=null, R32: go.Slice<go.unicode.Range32>=null, latinOffset: go.GoInt=0);

}