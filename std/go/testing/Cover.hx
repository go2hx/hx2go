package go.testing;

@:structInit
@:go.Type({ name: "Cover", instanceName: "testing.Cover", imports: ["testing"] })
extern class Cover {

    @:native("Mode") var mode: String;
    @:native("Counters") var counters: go.Map<String, go.Slice<go.UInt32>>;
    @:native("Blocks") var blocks: go.Map<String, go.Slice<go.testing.CoverBlock>>;
    @:native("CoveredPackages") var coveredPackages: String;

function new(mode: String, counters: go.Map<String, go.Slice<go.UInt32>>, blocks: go.Map<String, go.Slice<go.testing.CoverBlock>>, coveredPackages: String);

}