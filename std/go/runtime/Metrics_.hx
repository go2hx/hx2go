package go.runtime;

@:go.Type({ name: "metrics", instanceName: "metrics.metrics", imports: ["runtime/metrics"] })
extern class Metrics_ {

    @:native("KindBad") static var kindBad: go.runtime.metrics.ValueKind;
    @:native("KindFloat64") static var kindFloat64: go.runtime.metrics.ValueKind;
    @:native("KindFloat64Histogram") static var kindFloat64Histogram: go.runtime.metrics.ValueKind;
    @:native("KindUint64") static var kindUint64: go.runtime.metrics.ValueKind;

    @:native("All") static function all(): (go.Slice<go.runtime.metrics.Description>);
    @:native("Read") static function read(m: go.Slice<go.runtime.metrics.Sample>): Void;

}