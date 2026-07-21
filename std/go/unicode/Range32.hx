package go.unicode;

@:structInit
@:go.Type({ name: "Range32", instanceName: "unicode.Range32", imports: ["unicode"] })
extern class Range32 {

    @:native("Lo") var lo: go.UInt32;
    @:native("Hi") var hi: go.UInt32;
    @:native("Stride") var stride: go.UInt32;

    function new(lo: go.UInt32, hi: go.UInt32, stride: go.UInt32);

}