package go.testing;

/**
    BenchmarkResult contains the results of a benchmark run.
**/
@:structInit
@:go.Type({ name: "BenchmarkResult", instanceName: "testing.BenchmarkResult", imports: ["testing"] })
extern class BenchmarkResult {

    @:native("N") var N: go.GoInt;
    @:native("T") var T: go.time.Duration;
    @:native("Bytes") var bytes: go.Int64;
    @:native("MemAllocs") var memAllocs: go.UInt64;
    @:native("MemBytes") var memBytes: go.UInt64;
    @:native("Extra") var extra: go.Map<String, Float>;

    function new(N: go.GoInt=0, T: go.time.Duration=cast 0, bytes: go.Int64=0, memAllocs: go.UInt64=0, memBytes: go.UInt64=0, extra: go.Map<String, Float>=null);

    /**
        AllocedBytesPerOp returns the "B/op" metric,
        which is calculated as r.MemBytes / r.N.
    **/
    @:native("AllocedBytesPerOp") function allocedBytesPerOp(): (go.Int64);
    /**
        AllocsPerOp returns the "allocs/op" metric,
        which is calculated as r.MemAllocs / r.N.
    **/
    @:native("AllocsPerOp") function allocsPerOp(): (go.Int64);
    /**
        MemString returns r.AllocedBytesPerOp and r.AllocsPerOp in the same format as 'go test'.
    **/
    @:native("MemString") function memString(): (String);
    /**
        NsPerOp returns the "ns/op" metric.
    **/
    @:native("NsPerOp") function nsPerOp(): (go.Int64);
    /**
        String returns a summary of the benchmark results.
        It follows the benchmark result line format from
        https://golang.org/design/14313-benchmark-format, not including the
        benchmark name.
        Extra metrics override built-in metrics of the same name.
        String does not include allocs/op or B/op, since those are reported
        by [BenchmarkResult.MemString].
    **/
    @:native("String") function string(): (String);

}