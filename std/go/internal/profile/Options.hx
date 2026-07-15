package go.internal.profile;

@:structInit
@:go.Type({ name: "Options", instanceName: "profile.Options", imports: ["internal/profile"] })
extern class Options {

    @:native("SampleValue") var sampleValue: (s: go.Slice<go.Int64>) -> go.Int64;
    @:native("SampleMeanDivisor") var sampleMeanDivisor: (s: go.Slice<go.Int64>) -> go.Int64;
    @:native("DropNegative") var dropNegative: Bool;
    @:native("KeptNodes") var keptNodes: go.internal.profile.NodeSet;

function new(sampleValue: (s: go.Slice<go.Int64>) -> go.Int64, sampleMeanDivisor: (s: go.Slice<go.Int64>) -> go.Int64, dropNegative: Bool, keptNodes: go.internal.profile.NodeSet);

}