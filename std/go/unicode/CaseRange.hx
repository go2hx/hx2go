package go.unicode;

@:structInit
@:go.Type({ name: "CaseRange", instanceName: "unicode.CaseRange", imports: ["unicode"] })
extern class CaseRange {

    @:native("Lo") var lo: go.UInt32;
    @:native("Hi") var hi: go.UInt32;
    @:native("Delta") var delta: go.unicode.D;

    function new(lo: go.UInt32, hi: go.UInt32, delta: go.unicode.D);

}