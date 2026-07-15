package go.internal.trace;

@:structInit
@:go.Type({ name: "Range", instanceName: "trace.Range", imports: ["internal/trace"] })
extern class Range {

    @:native("Name") var name: String;
    @:native("Scope") var scope: go.internal.trace.ResourceID;

function new(name: String, scope: go.internal.trace.ResourceID);

}