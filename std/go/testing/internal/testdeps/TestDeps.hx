package go.testing.internal.testdeps;

@:structInit
@:go.Type({ name: "TestDeps", instanceName: "testdeps.TestDeps", imports: ["testing/internal/testdeps"] })
extern class TestDeps {

    @:native("CheckCorpus") function checkCorpus(vals: go.Slice<Dynamic>, types: go.Slice<go.reflect.Type>): go.Error;
    @:native("CoordinateFuzzing") function coordinateFuzzing(timeout: go.time.Duration, limit: go.Int64, minimizeTimeout: go.time.Duration, minimizeLimit: go.Int64, parallel: go.GoInt, seed: go.Slice<go.internal.fuzz.CorpusEntry>, types: go.Slice<go.reflect.Type>, corpusDir: String, cacheDir: String): go.Error;
    @:native("ImportPath") function importPath(): String;
    @:go.Tuple("mode", "tearDown", "snapcov") @:native("InitRuntimeCoverage") function initRuntimeCoverage(): go.Tuple<{ mode: String, tearDown: (p0: String, p1: String) -> go.Result<String>, snapcov: () -> Float }>;
    @:native("MatchString") function matchString(pat: String, str: String): go.Result<Bool>;
    @:native("ModulePath") function modulePath(): String;
    @:native("ReadCorpus") function readCorpus(dir: String, types: go.Slice<go.reflect.Type>): go.Result<go.Slice<go.internal.fuzz.CorpusEntry>>;
    @:native("ResetCoverage") function resetCoverage(): Void;
    @:native("RunFuzzWorker") function runFuzzWorker(fn: (p0: go.internal.fuzz.CorpusEntry) -> go.Error): go.Error;
    @:native("SetPanicOnExit0") function setPanicOnExit0(v: Bool): Void;
    @:native("SnapshotCoverage") function snapshotCoverage(): Void;
    @:native("StartCPUProfile") function startCPUProfile(w: go.io.Writer): go.Error;
    @:native("StartTestLog") function startTestLog(w: go.io.Writer): Void;
    @:native("StopCPUProfile") function stopCPUProfile(): Void;
    @:native("StopTestLog") function stopTestLog(): go.Error;
    @:native("WriteProfileTo") function writeProfileTo(name: String, w: go.io.Writer, debug: go.GoInt): go.Error;

}