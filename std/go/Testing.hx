package go;

@:go.Type({ name: "testing", instanceName: "testing.testing", imports: ["testing"] })
extern class Testing {

    @:native("AllocsPerRun") static function allocsPerRun(runs: go.GoInt, f: () -> Void): Float;
    @:native("Benchmark") static function benchmark(f: (b: go.Pointer<go.testing.B>) -> Void): go.testing.BenchmarkResult;
    @:native("CoverMode") static function coverMode(): String;
    @:native("Coverage") static function coverage(): Float;
    @:native("Init") static function init(): Void;
    @:native("Main") static function main(matchString: (pat: String, str: String) -> go.Result<Bool>, tests: go.Slice<go.testing.InternalTest>, benchmarks: go.Slice<go.testing.InternalBenchmark>, examples: go.Slice<go.testing.InternalExample>): Void;
    @:native("MainStart") static function mainStart(deps: go.testing.testDeps, tests: go.Slice<go.testing.InternalTest>, benchmarks: go.Slice<go.testing.InternalBenchmark>, fuzzTargets: go.Slice<go.testing.InternalFuzzTarget>, examples: go.Slice<go.testing.InternalExample>): go.Pointer<go.testing.M>;
    @:native("RegisterCover") static function registerCover(c: go.testing.Cover): Void;
    @:native("RunBenchmarks") static function runBenchmarks(matchString: (pat: String, str: String) -> go.Result<Bool>, benchmarks: go.Slice<go.testing.InternalBenchmark>): Void;
    @:native("RunExamples") static function runExamples(matchString: (pat: String, str: String) -> go.Result<Bool>, examples: go.Slice<go.testing.InternalExample>): Bool;
    @:native("RunTests") static function runTests(matchString: (pat: String, str: String) -> go.Result<Bool>, tests: go.Slice<go.testing.InternalTest>): Bool;
    @:native("Short") static function short(): Bool;
    @:native("Testing") static function testing(): Bool;
    @:native("Verbose") static function verbose(): Bool;

}