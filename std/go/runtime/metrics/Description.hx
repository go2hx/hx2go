package go.runtime.metrics;

@:structInit
@:go.Type({ name: "Description", instanceName: "metrics.Description", imports: ["runtime/metrics"] })
extern class Description {

    @:native("Name") var name: String;
    @:native("Description") var description: String;
    @:native("Kind") var kind: go.runtime.metrics.ValueKind;
    @:native("Cumulative") var cumulative: Bool;

function new(name: String, description: String, kind: go.runtime.metrics.ValueKind, cumulative: Bool);

}