package go.testing;

/**
    Cover records information about test coverage checking.
    NOTE: This struct is internal to the testing infrastructure and may change.
    It is not covered (yet) by the Go 1 compatibility guidelines.
**/
@:structInit
@:go.Type({ name: "Cover", instanceName: "testing.Cover", imports: ["testing"] })
extern class Cover {

    @:native("Mode") var mode: String;
    @:native("Counters") var counters: go.Map<String, go.Slice<go.UInt32>>;
    @:native("Blocks") var blocks: go.Map<String, go.Slice<go.testing.CoverBlock>>;
    @:native("CoveredPackages") var coveredPackages: String;

    function new(mode: String="", counters: go.Map<String, go.Slice<go.UInt32>>=null, blocks: go.Map<String, go.Slice<go.testing.CoverBlock>>=null, coveredPackages: String="");

}