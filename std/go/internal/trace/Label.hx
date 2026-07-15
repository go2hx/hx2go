package go.internal.trace;

@:structInit
@:go.Type({ name: "Label", instanceName: "trace.Label", imports: ["internal/trace"] })
extern class Label {

    @:native("Label") var label: String;
    @:native("Resource") var resource: go.internal.trace.ResourceID;

function new(label: String, resource: go.internal.trace.ResourceID);

}