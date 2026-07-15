package go.runtime.metrics;

@:structInit
@:go.Type({ name: "Sample", instanceName: "metrics.Sample", imports: ["runtime/metrics"] })
extern class Sample {

    @:native("Name") var name: String;
    @:native("Value") var value: go.runtime.metrics.Value;

function new(name: String, value: go.runtime.metrics.Value);

}