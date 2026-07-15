package go.internal;

@:go.Type({ name: "fuzz", instanceName: "fuzz.fuzz", imports: ["internal/fuzz"] })
extern class Fuzz {

    @:native("CheckCorpus") static function checkCorpus(vals: go.Slice<Dynamic>, types: go.Slice<go.reflect.Type>): go.Error;
    @:native("CoordinateFuzzing") static function coordinateFuzzing(ctx: go.context.Context, opts: go.internal.fuzz.CoordinateFuzzingOpts): go.Error;
    @:native("ReadCorpus") static function readCorpus(dir: String, types: go.Slice<go.reflect.Type>): go.Result<go.Slice<go.internal.fuzz.CorpusEntry>>;
    @:native("ResetCoverage") static function resetCoverage(): Void;
    @:native("RunFuzzWorker") static function runFuzzWorker(ctx: go.context.Context, fn: (p0: go.internal.fuzz.CorpusEntry) -> go.Error): go.Error;
    @:native("SnapshotCoverage") static function snapshotCoverage(): Void;

}