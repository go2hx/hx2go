package go.runtime.metrics;

@:structInit
@:go.Type({ name: "Float64Histogram", instanceName: "metrics.Float64Histogram", imports: ["runtime/metrics"] })
extern class Float64Histogram {

    @:native("Counts") var counts: go.Slice<go.UInt64>;
    @:native("Buckets") var buckets: go.Slice<Float>;

function new(counts: go.Slice<go.UInt64>, buckets: go.Slice<Float>);

}