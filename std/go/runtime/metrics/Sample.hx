package go.runtime.metrics;

/**
    Sample captures a single metric sample.
**/
@:structInit
@:go.Type({ name: "Sample", instanceName: "metrics.Sample", imports: ["runtime/metrics"] })
extern class Sample {

    @:native("Name") var name: String;
    @:native("Value") var value: go.runtime.metrics.Value;

    function new(name: String="", value: go.runtime.metrics.Value);

}