package go.internal.trace;

@:structInit
@:go.Type({ name: "Metric", instanceName: "trace.Metric", imports: ["internal/trace"] })
extern class Metric {

    @:native("Name") var name: String;
    @:native("Value") var value: go.internal.trace.Value;

function new(name: String, value: go.internal.trace.Value);

}