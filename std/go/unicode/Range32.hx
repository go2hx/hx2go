package go.unicode;

/**
    Range32 represents of a range of Unicode code points and is used when one or
    more of the values will not fit in 16 bits. The range runs from Lo to Hi
    inclusive and has the specified stride. Lo and Hi must always be >= 1<<16.
**/
@:structInit
@:go.Type({ name: "Range32", instanceName: "unicode.Range32", imports: ["unicode"] })
extern class Range32 {

    @:native("Lo") var lo: go.UInt32;
    @:native("Hi") var hi: go.UInt32;
    @:native("Stride") var stride: go.UInt32;

    function new(lo: go.UInt32=0, hi: go.UInt32=0, stride: go.UInt32=0);

}