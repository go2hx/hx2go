package go.runtime.metrics;

@:structInit
@:go.Type({ name: "Value", instanceName: "metrics.Value", imports: ["runtime/metrics"] })
extern class Value {

    @:native("Float64") function float64(): Float;
    @:native("Float64Histogram") function float64Histogram(): go.Pointer<go.runtime.metrics.Float64Histogram>;
    @:native("Kind") function kind(): go.runtime.metrics.ValueKind;
    @:native("Uint64") function uint64(): go.UInt64;

}