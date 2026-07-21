package go.unicode;

@:structInit
@:go.Type({ name: "RangeTable", instanceName: "unicode.RangeTable", imports: ["unicode"] })
extern class RangeTable {

    @:native("R16") var R16: go.Slice<go.unicode.Range16>;
    @:native("R32") var R32: go.Slice<go.unicode.Range32>;
    @:native("LatinOffset") var latinOffset: go.GoInt;

    function new(R16: go.Slice<go.unicode.Range16>, R32: go.Slice<go.unicode.Range32>, latinOffset: go.GoInt);

}