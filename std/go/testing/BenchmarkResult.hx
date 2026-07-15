package go.testing;

@:structInit
@:go.Type({ name: "BenchmarkResult", instanceName: "testing.BenchmarkResult", imports: ["testing"] })
extern class BenchmarkResult {

    @:native("N") var N: go.GoInt;
    @:native("T") var T: go.time.Duration;
    @:native("Bytes") var bytes: go.Int64;
    @:native("MemAllocs") var memAllocs: go.UInt64;
    @:native("MemBytes") var memBytes: go.UInt64;
    @:native("Extra") var extra: go.Map<String, Float>;

function new(N: go.GoInt, T: go.time.Duration, bytes: go.Int64, memAllocs: go.UInt64, memBytes: go.UInt64, extra: go.Map<String, Float>);

    @:native("AllocedBytesPerOp") function allocedBytesPerOp(): go.Int64;
    @:native("AllocsPerOp") function allocsPerOp(): go.Int64;
    @:native("MemString") function memString(): String;
    @:native("NsPerOp") function nsPerOp(): go.Int64;
    @:native("String") function string(): String;

}