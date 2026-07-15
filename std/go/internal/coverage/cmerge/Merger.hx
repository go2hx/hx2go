package go.internal.coverage.cmerge;

@:structInit
@:go.Type({ name: "Merger", instanceName: "cmerge.Merger", imports: ["internal/coverage/cmerge"] })
extern class Merger {

    @:native("Granularity") function granularity(): go.internal.coverage.CounterGranularity;
    @:go.Tuple("p0", "p1") @:native("MergeCounters") function mergeCounters(dst: go.Slice<go.UInt32>, src: go.Slice<go.UInt32>): go.Tuple<{ p0: go.Error, p1: Bool }>;
    @:native("Mode") function mode(): go.internal.coverage.CounterMode;
    @:native("ResetModeAndGranularity") function resetModeAndGranularity(): Void;
    @:native("SaturatingAdd") function saturatingAdd(dst: go.UInt32, src: go.UInt32): go.UInt32;
    @:native("SetModeAndGranularity") function setModeAndGranularity(mdf: String, cmode: go.internal.coverage.CounterMode, cgran: go.internal.coverage.CounterGranularity): go.Error;
    @:native("SetModeMergePolicy") function setModeMergePolicy(policy: go.internal.coverage.cmerge.ModeMergePolicy): Void;

}