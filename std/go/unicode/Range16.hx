package go.unicode;

@:structInit
@:go.Type({ name: "Range16", instanceName: "unicode.Range16", imports: ["unicode"] })
extern class Range16 {

    @:native("Lo") var lo: go.UInt16;
    @:native("Hi") var hi: go.UInt16;
    @:native("Stride") var stride: go.UInt16;

function new(lo: go.UInt16, hi: go.UInt16, stride: go.UInt16);

}