package go.unicode;

/**
    Range16 represents of a range of 16-bit Unicode code points. The range runs from Lo to Hi
    inclusive and has the specified stride.
**/
@:structInit
@:go.Type({ name: "Range16", instanceName: "unicode.Range16", imports: ["unicode"] })
extern class Range16 {

    @:native("Lo") var lo: go.UInt16;
    @:native("Hi") var hi: go.UInt16;
    @:native("Stride") var stride: go.UInt16;

    function new(lo: go.UInt16=0, hi: go.UInt16=0, stride: go.UInt16=0);

}