package go.runtime;

@:go.Type({ name: "metrics", instanceName: "metrics.metrics", imports: ["runtime/metrics"] })
extern class Metrics {

    @:native("KindBad") static var KindBad: go.runtime.metrics.ValueKind;
    @:native("KindFloat64") static var KindFloat64: go.runtime.metrics.ValueKind;
    @:native("KindFloat64Histogram") static var KindFloat64Histogram: go.runtime.metrics.ValueKind;
    @:native("KindUint64") static var KindUint64: go.runtime.metrics.ValueKind;

    @:native("All") static function all(): go.Slice<go.runtime.metrics.Description>;
    @:native("Read") static function read(m: go.Slice<go.runtime.metrics.Sample>): Void;

}