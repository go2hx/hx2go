package go.testing;

@:go.Type({ name: "matchStringOnly", instanceName: "testing.matchStringOnly", imports: ["testing"] })
extern class MatchStringOnly {

    @:native("CheckCorpus") function checkCorpus(p0: go.Slice<Dynamic>, p1: go.Slice<go.reflect.Type>): (go.Error);
    @:native("CoordinateFuzzing") function coordinateFuzzing(p0: go.time.Duration, p1: go.Int64, p2: go.time.Duration, p3: go.Int64, p4: go.GoInt, p5: go.Slice<go.testing.CorpusEntry>, p6: go.Slice<go.reflect.Type>, p7: String, p8: String): (go.Error);
    @:native("ImportPath") function importPath(): (String);
    @:go.Tuple("mode", "tearDown", "snapcov") @:native("InitRuntimeCoverage") function initRuntimeCoverage(): (go.Tuple<{ mode: String, tearDown: (p0: String, p1: String) -> (go.Result<String>), snapcov: () -> (Float) }>);
    @:native("MatchString") function matchString(pat: String, str: String): (go.Result<Bool>);
    @:native("ModulePath") function modulePath(): (String);
    @:native("ReadCorpus") function readCorpus(p0: String, p1: go.Slice<go.reflect.Type>): (go.Result<go.Slice<go.testing.CorpusEntry>>);
    @:native("ResetCoverage") function resetCoverage(): Void;
    @:native("RunFuzzWorker") function runFuzzWorker(p0: (p0: go.testing.CorpusEntry) -> (go.Error)): (go.Error);
    @:native("SetPanicOnExit0") function setPanicOnExit0(p0: Bool): Void;
    @:native("SnapshotCoverage") function snapshotCoverage(): Void;
    @:native("StartCPUProfile") function startCPUProfile(w: go.io.Writer): (go.Error);
    @:native("StartTestLog") function startTestLog(p0: go.io.Writer): Void;
    @:native("StopCPUProfile") function stopCPUProfile(): Void;
    @:native("StopTestLog") function stopTestLog(): (go.Error);
    @:native("WriteProfileTo") function writeProfileTo(p0: String, p1: go.io.Writer, p2: go.GoInt): (go.Error);

}