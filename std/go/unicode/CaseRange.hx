package go.unicode;

/**
    CaseRange represents a range of Unicode code points for simple (one
    code point to one code point) case conversion.
    The range runs from Lo to Hi inclusive, with a fixed stride of 1. Deltas
    are the number to add to the code point to reach the code point for a
    different case for that character. They may be negative. If zero, it
    means the character is in the corresponding case. There is a special
    case representing sequences of alternating corresponding Upper and Lower
    pairs. It appears with a fixed Delta of
    
    	{UpperLower, UpperLower, UpperLower}
    
    The constant UpperLower has an otherwise impossible delta value.
**/
@:structInit
@:go.Type({ name: "CaseRange", instanceName: "unicode.CaseRange", imports: ["unicode"] })
extern class CaseRange {

    @:native("Lo") var lo: go.UInt32;
    @:native("Hi") var hi: go.UInt32;
    @:native("Delta") var delta: go.unicode.D;

    function new(lo: go.UInt32=0, hi: go.UInt32=0, delta: go.unicode.D);

}